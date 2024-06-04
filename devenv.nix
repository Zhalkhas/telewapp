{ pkgs, lib, config, inputs, ... }:

{
  dotenv.enable = true;
  env.CHROME_EXECUTABLE = "google-chrome-stable";

  packages = with pkgs; [ 
    git  
    flutter
    google-chrome
    ngrok
    jq
    yq
    curl
    (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          github.copilot
          github.copilot-chat
          bbenoist.nix
          jnoortheen.nix-ide
          mkhl.direnv
          dart-code.flutter
          yzhang.markdown-all-in-one
          shd101wyy.markdown-preview-enhanced
          davidanson.vscode-markdownlint
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name  = "vscode-yaml";
            publisher = "redhat";
            version = "1.14.0";
            sha256 = "hCRyDA6oZF7hJv0YmbNG3S2XPtNbyxX1j3qL1ixOnF8=";
          }
          {
            name = "vscode-conventional-commits";
            publisher = "vivaxy";
            version = "1.25.0";
            sha256 = "KPP1suR16rIJkwj8Gomqa2ExaFunuG42fp14lBAZuwI=";

          }
        ];
      })    
  ];

  languages = {
    nix.enable = true;
    dart.enable = true;
  };

  scripts = {
    generate-send-msg-data.exec = ''
     cat <<EOF
{
  "chat_id": $CHAT_ID,
  "text": "Open",
  "reply_markup": {
    "inline_keyboard": [
      [
        {
          "text": "Open",
          "web_app": {
            "url": "$1"
          }
        }
      ]
    ]
  }  
}
EOF
    '';
  };

  processes = {
    chrome-debug.exec = "google-chrome-stable chrome://inspect/#devices"; 
    tgwebapp.exec = "cd examples/counter && flutter run -dweb-server --web-port=$PORT";
    ngrok = {
      exec = ''
        #set -x
        ngrok http $PORT &
        P1=$!
        sleep 5
        NGROK_URL=$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
        curl -H'Content-Type: application/json' -XPOST -d "$(generate-send-msg-data $NGROK_URL)" https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage 2>&1
        wait $P1
      '';
    };
  };
  
  process.before =''
    set -x; 
    curl https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/deleteWebhook; 
  '';
  
  process.after = ''
    set -x; 
    curl https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/deleteWebhook; 
  '';


}
