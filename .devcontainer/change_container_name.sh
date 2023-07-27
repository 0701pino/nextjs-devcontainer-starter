#!/bin/sh

# コンテナ名などをnext_appから変更するためのシェル

if [ $# -ne 1 ]; then
  echo "使用法: $0 コンテナ名"
  exit 1
fi

# 入力されたアプリ名を変数に格納
app_name="$1"

# コンテナ名の変更を確認
echo "入力されたコンテナ名は: $app_name です"
read -p "next_appから${app_name}に変更しますか？ (Y/n): " answer

# 変更するかどうかの入力を判定
if [ "$answer" != "Y" ] && [ "$answer" != "y" ] && [ "$answer" != "yes" ] && [ "$answer" != "" ]; then
  echo "処理を終了します。"
  exit 0
fi

sed -i "s/next_app_devcontainer/${app_name}_devcontainer/g" devcontainer.json
sed -i "s/next_app_node_modules/${app_name}_node_modules/g" ../docker-compose.dev.yml

FILE_LIST="../docker-compose.dev.yml ../docker-compose.yml"
for FILE in $FILE_LIST; do
  sed -i "s/container_name: next_app/container_name: ${app_name}/g" $FILE
done
