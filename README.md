# Next.js DevContainer & Docker Compose テンプレート

DevContainerとDocker Composeを使用したNext.js用テンプレートです。

## 特徴

- Visual Studio Codeの拡張機能が自動的にインストールされます。
- Visual Studio Codeの設定が事前に行われます。
- コンテナ内のデフォルトシェルはzshを使用します。
- 開発用とリリース用のdocker-compose.ymlが分かれています。
- リリース用のdocker-compose.ymlはマルチステージビルドでコンテナサイズを減らしています。

## 設定

- ベースイメージ: node:18.12.1-bullseye-slim
- コンテナユーザー: node
- 作業ディレクトリ: /workspace/next_app

## バージョン

使用しているバージョンは以下の通りです。

- node: v18.12.1
- yarn: 1.22.19
- next: 13.4.9
- react: 18.2.0
- typescript: 5.1.6
- tailwindcss: 3.3.2

### Visual Studio Code 拡張機能

自動的にインストールされる拡張機能は以下の通りです。

- Japanese Language Pack for Visual Studio Code
- ESLint
- Prettier
- Auto Rename Tag
- GitLens

### Visual Studio Code 設定

DevContainerの初期化後に自動的に設定されるVisual Studio Codeの設定は以下の通りです。

- 「ファイル保存時にフォーマット処理をする」をオンに設定
- javascript、javascriptreact、typescript、typescriptreact、jsonのデフォルトフォーマッターをPrettierに設定
- ESLintの対象をjavascript、javascriptreact、typescript、typescriptreactに設定
- ファイル保存時にESLintによる自動修正を行うように設定
- javascript、typescriptの自動フォーマットを無効に設定
- javascript、typescriptのVSCodeデフォルトのフォーマッターを無効化
- 保存時のインポート文の自動整理を無効化（ESLintでimport順自動整列を行うため）

## コンテナ名の変更

コンテナ名を変更するには、.devcontainerの中にあるchange_container_name.shを使用します。
、
```
sh change_service_name.sh app_name
```
上記を実行すると、コンテナ名がnext_appからapp_nameに変更されます。

同時にdevcontainer.jsonのnext_app_devcontainerがapp_name_devcontainer、next_app_node_modulesがapp_name_node_modulesに変更されます。

