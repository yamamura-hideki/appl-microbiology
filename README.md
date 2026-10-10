# 応用微生物学研究室 ホームページ

山梨大学 応用微生物学研究室のホームページです。
[Hugo](https://gohugo.io/) で作った静的サイトで、GitHub Pages で公開します。
更新はブラウザの管理画面（[Sveltia CMS](https://github.com/sveltia/sveltia-cms)）から行えます。

---

## 1. 初回の公開手順（1回だけ）

1. **GitHub アカウントを用意**します（研究室用のアカウントか Organization がおすすめです）。
2. GitHub で **新しいリポジトリを作成**します。
   - リポジトリ名の例: `appl-microbiology`（URL が `[https://<アカウント名>.github.io/appl-microbiology/](https://yamamura-hideki.github.io/appl-microbiology/)` になります）
   - Public を選びます（無料プランの GitHub Pages は Public リポジトリが必要です）。
3. このフォルダの中身を**すべてアップロード**します。
   - リポジトリ画面の「uploading an existing file」をクリックし、フォルダの中身（`.github` フォルダを含む）をドラッグ＆ドロップして「Commit changes」を押します。
   - ※ `.github` は隠しフォルダです。Windows のエクスプローラーで「表示 → 隠しファイル」をオンにしてください。アップロードできない場合は [GitHub Desktop](https://desktop.github.com/) を使うと確実です。
4. リポジトリの **Settings → Pages** を開き、「Build and deployment」の Source を **GitHub Actions** に変更します。
5. **Actions** タブを開き、「Build and deploy」を選んで **Run workflow** を押します。
   - 初回は旧 Wix サイトから画像（約80枚）とキャンパスマップ PDF を自動で取り込みます（数分かかります）。
6. 完了すると `https://<アカウント名>.github.io/<リポジトリ名>/` でサイトが表示されます。

> ⚠️ 旧 Wix サイトは、新サイトで画像が表示されていることを確認するまで削除しないでください。

## 2. ブラウザからの更新方法（管理画面）

### 準備（各自1回だけ）
1. GitHub にログインし、[Fine-grained token の作成画面](https://github.com/settings/personal-access-tokens/new) を開きます。
2. 「Repository access」で **Only select repositories → このリポジトリ** を選びます。
3. 「Permissions」の **Contents を Read and write** にします。
4. 「Generate token」を押して表示されたトークンを、パスワード管理ソフト等に安全に保存します。
   - 研究室メンバーに更新を任せる場合は、リポジトリの Settings → Collaborators でその人を招待し、本人のアカウントでトークンを作ってもらいます。

### 更新
1. `https://<アカウント名>.github.io/<リポジトリ名>/admin/` を開きます。
2. 「Sign In with Token」（トークンでサインイン）を選び、保存したトークンを貼り付けます。
3. 編集できる項目
   - **お知らせ**: 新規作成で記事を追加（タイトル・日付・本文・写真）
   - **メンバー・アルバム・論文**: 年度替わりの学生名簿の更新、写真の追加、論文の追加
   - **固定ページ**: トップページ・研究紹介・アクセスなどの文章
4. 「保存」すると GitHub に記録され、**1〜2分後に自動でサイトに反映**されます。

## 3. フォルダ構成

| 場所 | 内容 |
|---|---|
| `content/news/` | お知らせ記事（1記事 = 1ファイル） |
| `content/` その他 | 各ページの本文（Markdown） |
| `data/members.yaml` | メンバー一覧 |
| `data/album.yaml` | アルバム写真 |
| `data/papers.yaml` | 論文・業績リンク |
| `static/images/` | 画像（管理画面からの追加分は `uploads/`） |
| `static/admin/` | 管理画面の設定 |
| `layouts/`, `assets/css/` | デザイン（テンプレート・CSS） |
| `hugo.toml` | サイト設定（メニュー、住所、問い合わせメール） |

## 4. 独自ドメインにしたいとき
Settings → Pages の「Custom domain」にドメインを入力し、ドメイン側で DNS を設定します。
サイト内のリンクは自動で新しい URL に合わせて作られるので、ファイルの修正は不要です。

## 5. 手元のパソコンで確認したいとき（任意）
[Hugo extended](https://gohugo.io/installation/) をインストールし、このフォルダで `hugo server` を実行して http://localhost:1313/ を開きます。
