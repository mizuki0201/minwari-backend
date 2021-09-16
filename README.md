# みんわり（技術選定・実装振り返り編）

アプリ解説編は[こちら](https://github.com/mizuki0201/minwari-frontend)。

## アプリについて

### アプリ概要

本アプリは、友達とグループを作り、その中で割り勘ができるアプリです。  
グループを作り、そのメンバーで出かけたりした際の支払管理を行うことができます。  
また、グループ内でイベントを複数作成できるため、たくさん遊んだりするメンバーでグループを作れば、「次回多めに払ってくれればいいよ〜」といったように、割り勘して支払いが発生した分を次回出かける際などに繰り越すこともできます。

### URL

〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜

### テスト用アカウント

email：  
password：

## 技術選定

<div width='100%' display='flex' align='center' justify-content='space-around'>
  <img width="120px" alt="react" src="https://user-images.githubusercontent.com/69416789/133558816-9e7cee6b-46d3-460e-90bc-da2b97edcb8c.png">  
  <img width="80px" alt="Typescript" src="https://user-images.githubusercontent.com/69416789/133558873-3359dbc4-5ae0-4477-8a58-d7d7a07bafe7.png">  
  <img width="150px" alt="chakraUI" src="https://user-images.githubusercontent.com/69416789/133559047-33178b3f-b1eb-4f58-9e1a-78578bc36aaa.png">
</div>
<div display='flex' align='center' justify-content='center'>
  <img width="150px" alt="rails_logo" src="https://user-images.githubusercontent.com/69416789/133559112-c0ffdb11-9b81-4c60-9e93-ba04085ab216.png">  
  <img width="100px" alt="docker" src="https://user-images.githubusercontent.com/69416789/133559125-3e40743f-fea8-4b23-8bd3-f3349949a24d.png">  
  <img width="150px" alt="TravisCI" src="https://user-images.githubusercontent.com/69416789/133559162-de36673e-8aab-4595-8371-27c0ea6c6f09.png">  
  <img width="150px" alt="Heroku" src="https://user-images.githubusercontent.com/69416789/133559166-b9afceb8-9a95-49af-99ed-bcbf237f60bb.png">
</div>

### 使用技術一覧

### 技術選定の理由 ①React

近年流行りの SPA でのアプリ開発を行いたいと考え、JavaScript と TypeScript の学習を行った上で、React にて実装しました。  
また、React や Vue.js などの JavaScript フレームワークを採用している企業も多く、そこに向けての学習も兼ねて React を選定しました。

### 技術選定の理由 ②Ruby on Rails

firebase などのある程度自動で処理を行ってくれるツールも存在しますが、現職で基礎的な知識は学習済みであることと、よりサーバーサイドのロジックを学習するためにも Ruby on Rails を選定しました。  
今回は基本的な CRUD 機能がメインではありますが、サービスオブジェクトの利用など、よりスマートな実装ができるように学習も進めました。

### 技術選定の理由 ③Docker、TravisCI

環境構築や、テスト/デプロイをより簡易的に行うことができるツールを学習し、使用しました。  
個人のアプリであれば自動化によるメリットを感じにくいですが、規模が大きく慣れればなるほど自動化によるメリットが大きいと考えます。  
そのため、企業で比較的大規模なアプリを作成する際には、基本的には Docker による環境構築や CI/CD ツールによるテストやデプロイの自動化を行っており、そこに向けた学習も兼ねて上記を選定しました。

## 実装過程

### 実装で意識したこと

#### ①atomic design の採用

フロント側は、コンポーネントの再利用性を高め、よりシンプルなコードにするために atomic design を採用しました。  
学びながら実践したため不完全なところは多々あるかと思いますが、「atoms, molecules, organisms, templates, pages」の 5 階層に分け、1 つのコンポーネントで 70~80 行くらいに収まるように実装しました。  
一部 100 行を超えてしまったコンポーネントはありますが、1 つのコンポーネントに 1 つの役割を負わせ、分かりやすくコンポーネント分割ができたのではないかと考えます。

#### ② 常に先を見通し、ゴールから逆算してやるべきことを考えたこと

手戻りを減らすため、定期的に「アプリの完成系から逆算し、今から何を実装する必要があるか」を考えました。  
行き当たりばったりで、手戻りが多くなると実装にも時間がかかってしまうため、紙に書いたり相談できる方に早期から壁打ちを行い、手戻りがないように取り組みました。

実際には、現職で働きながらも勤務前後の時間や休みの日を利用し、2~3 週間ほどで完成まで至れたため、効果はあったと考えています。

### 実装で困ったこと

#### ① 要件定義・設計の難しさと重要性

意識したことの ② でも挙げたように、行き当たりばったりにならないよう事前に設計を考えることは行いましたが、それでもなお実装中に想定外の状況になり、再度設計を見直したことが何回かありました。  
その都度、手戻りで時間と手間がかかってしまったため、設計段階からきちんと考えておくことの重要性を痛感しました。

また、下記の「今後の課題 ①」にも記載がありますが、設計をするための知識習得も必須であると感じました。

#### ② 余分なレンダリングや冗長な処理をしないこと

今回、アプリの挙動としては問題ないが、console.log を設置すると余分にレンダリングされている記述もありました。  
小規模のアプリであれば問題ないかもしれないですが、大規模なアプリになると挙動が遅くなりアプリとしては欠陥となってしまう恐れがあることや、そもそもスマートなコードが書けていないということを感じました。

余分なレンダリングを起こしたり、冗長なコードにならないようにするためにも、今後様々な優れたコードを読んで勉強する必要性を感じながらの実装となりました。

## 実装振り返り

### 今後の展望

#### 今回は後回しにした機能の実装

今回実装を後回しにした機能を箇条書きで列挙します。

・レスポンシブ対応、ネイティブアプリ対応  
・返済ステータスの表示  
・返済時の金額指定  
・金額指定に付随した、返済可否を判定するロジック  
・マイページの実装

などが、当初は構想していたものの、まだ実装には至っていない部分です。  
今後はこれらの機能を実装し、さらなくアプリの改善を図りたいと考えています。

### 今後の課題

#### ① 設計思想やアルゴリズムなど、概念的な知識

言語が用意しているクラスやメソッドのように調べたらわかる _答えのあること_ ではなく、設計思想やアルゴリズム、エラーハンドリングのような _答えのないこと_ への理解が浅いと感じました。  
結果として、調べたらわかることを駆使して動くアプリは作れるけれど、アプリ全体の設計やアルゴリズムなどはこれがベストなのか、自分の中でも腹落ちしない部分があるように思います。

また、今回の実装で感じたことは、「事前に設計してから実装することの難しさ」です。  
実際にコードを書いていく中で、事前に洗い出すことができなかった仕様上の問題や実装時の問題に直面することが多々ありました。  
その度に仕様や実装方法を模索して進めていきましたが、実際には仕様は変えることはせず、実装方法も事前にある程度考えた上での実装が必要になると考えます。

そういった「概念的な部分」への理解の浅さが課題であり、今後は書籍や実際に運用されているアプリなどを参考に、学習していきたいと考えております。

#### ②UI/UX 設計

今回はプログラミング学習を目的としていたため、UI や UX については深く考慮せず進めましたが、進めていくうちに「ボタンはこの位置で良いのだろうか」「このレイアウトや配色はユーザー視点で違和感がないだろうか」などの疑問を持つことがありました。  
何も考えずにアプリを作っても、「見栄えが変なアプリ」や「操作しにくいアプリ」が生まれてしまい、結果としてどれだけコードをスマートに書いたとしても誰にも使用してもらえない可能性があると感じました。

プログラミングはあくまでも手段でしかなく、実現すべきことはユーザーの生活や業務に利便性を生むことだと考えているため、そのために「アプリを使ってもらう」ことを考えると、UI や UX へのこだわりは重要であると考えています。  
現在は知識不足のためできることは少ないですが、こちらも同様に書籍や実際に運用されているアプリなどを参考に、学習していきたいと考えております。
