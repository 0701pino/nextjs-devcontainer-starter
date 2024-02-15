# Next.js DevContainer & Docker Compose テンプレート

DevContainer と Docker Compose を使用した Next.js 用テンプレートです。

## 特徴

- Visual Studio Code の拡張機能が自動的にインストールされます。
- Visual Studio Code の設定が事前に行われます。
- コンテナ内のデフォルトシェルは zsh を使用します。
- 開発用とリリース用の docker-compose.yml が分かれています。
- リリース用の docker-compose.yml はマルチステージビルドでコンテナサイズを減らしています。

## コンテナ情報

- ベースイメージ: node:20-bullseye-slim
- コンテナユーザー: node
- 作業ディレクトリ: /workspace/next_app

## 使用バージョン

使用しているバージョンは以下の通りです。

- node: v20.11.0
- yarn: 1.22.19
- next: 14.1.0
- react: 18.2.0
- typescript: 5.3.3
- tailwindcss: 3.4.1

### Visual Studio Code 拡張機能

自動的にインストールされる拡張機能は以下の通りです。

- Japanese Language Pack for Visual Studio Code
- ESLint
- Prettier
- Auto Rename Tag
- GitLens
- Tailwind CSS IntelliSense

### Visual Studio Code 設定

DevContainer の初期化後に自動的に設定される Visual Studio Code の設定は以下の通りです。

- 「ファイル保存時にフォーマット処理をする」をオンに設定
- javascript、javascriptreact、typescript、typescriptreact、json のデフォルトフォーマッターを Prettier に設定
- ESLint の対象を javascript、javascriptreact、typescript、typescriptreact に設定
- ファイル保存時に ESLint による自動修正を行うように設定
- javascript、typescript の自動フォーマットを無効に設定
- javascript、typescript の VSCode デフォルトのフォーマッターを無効化
- 保存時のインポート文の自動整理を無効化(@ianvs/prettier-plugin-sort-imports でソートしているため)

## コンテナ名の変更

コンテナ名を変更するには、initial_setting.sh を使用します。
このシェルで、コンテナ名、ネットワーク名、ボリューム名、開発時にバインドするホスト側ポート番号を変更できます。

```
$sh initial_setting.sh
```
