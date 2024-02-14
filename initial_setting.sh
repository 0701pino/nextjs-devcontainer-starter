#!/bin/sh

# コンテナ名などをnext_appから変更するなど初期設定を行うシェル


echo "初期設定を行います。"
echo 
echo -n 'コンテナ名\e[90m(next_app)\e[0m: ' 
read app_name
app_name=${app_name:-next_app}
echo -n 'ホストのポート番号\e[90m(3000)\e[0m: ' 
read host_port
host_port=${host_port:-3000}

# コンテナ名の変更を確認
echo 
echo "次の設定に変更します"
echo "コンテナ名: $app_name"
echo "ネットワーク名: ${app_name}_network"
echo "ボリューム名: ${app_name}_node_modules"
echo "開発時のホストのポート番号: $host_port"
echo
read -p "変更しますか？ (Y/n): " answer
answer=${answer:-Y}

# 変更するかどうかの入力を判定
if [ "$answer" != "Y" ] && [ "$answer" != "y" ] && [ "$answer" != "yes" ] ; then
  echo "処理を終了します。"
  exit 0
fi
# コンテナ名の変更
sed -i "s/next_app_devcontainer/${app_name}_devcontainer/g" .devcontainer/devcontainer.json
sed -i "s/next_app_node_modules/${app_name}_node_modules/g" docker-compose.dev.yml

FILE_LIST="docker-compose.dev.yml docker-compose.yml"
for FILE in $FILE_LIST; do
  sed -i "s/container_name: next_app/container_name: ${app_name}/g" $FILE
  sed -i "s/next_app_network/${app_name}_network/g" $FILE
done


# ホストのポート番号を設定する
sed -i "s/127.0.0.1:3000/127.0.0.1:${host_port}/g" docker-compose.dev.yml

echo "変更しました。"