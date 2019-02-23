-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 23 2019 г., 07:50
-- Версия сервера: 5.6.41
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'IWuLKreGm-avakKEN_y58ReHmkyaLwZa', '$2y$13$bYbw0W7yTHpHGDvFAjJfRulWiw0Z7AfWgkV/he6ozKOgbHqJTUNgK', NULL, 'admin@admin.ru', 10, 1539281788, 1539281788);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `template` varchar(255) NOT NULL DEFAULT 'post',
  `redirect_url` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_category`
--

INSERT INTO `blog_category` (`id`, `parent_id`, `title`, `slug`, `banner`, `is_nav`, `sort_order`, `page_size`, `template`, `redirect_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Yii2', 'yii2', 'yii2.jpg', 1, 0, 0, '', '', 1, 1539516705, 1539516705);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `post_id`, `content`, `author`, `email`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Спасибо! Всё работает!', 'Vlad', 'vlad-planet@mail.ru', '', 1, 1539533717, 1539533751),
(2, 4, 'Hello!', 'Vlad', 'vlad-planet@mail.ru', '', 1, 1546710627, 1546710627),
(3, 1, 'Code!', 'Vlad', 'vlad-planet@mail.ru', '', 1, 1546717210, 1546717210),
(4, 2, 'Hello! Like!', 'Vlad', 'vlad-planet@mail.ru', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text,
  `content` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_post`
--

INSERT INTO `blog_post` (`id`, `category_id`, `title`, `brief`, `content`, `tags`, `slug`, `banner`, `click`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Yii2 изображения', '​Данная статья будет посвящена такой теме, как Yii2 изображения. Здесь мы посмотрим, как происходит загрузка и вывод загруженных изображений...', '<p>Данная статья будет посвящена такой теме, как Yii2 изображения. Здесь мы посмотрим, как происходит загрузка и вывод загруженных изображений.\r\n</p>\r\n<p>Итак, давайте затронем в данном цикле статей вопрос загрузки картинок. Операция, которая необходима практически на любом сайте: загрузка изображений товара в интернет-магазине или прикрепление картинки поста в блоге и т.д.\r\n</p>\r\n<p>Сделать это на самом деле относительно просто. Нам нужно всего-то знать, что для работы с загруженным файлом необходимо обратиться к классу yii\\web\\UploadedFile, объект которого и содержит всю информацию о загруженном файле.\r\n</p>\r\n<p>Давайте начнем с создания модели, которая будет осуществлять валидацию загружаемого файла (нам ведь нужен не любой файл, а именно изображение) и сохранять его в выбранную папку. Пусть наша модель называется UploadImage.\r\n</p>\r\n<pre>&lt;?php\r\nnamespace app\\models;\r\nuse yii\\base\\Model;\r\nuse yii\\web\\UploadedFile;\r\nclass UploadImage extends Model{\r\n    public $image;\r\n    public function rules(){\r\n        return[\r\n            [[\'image\'], \'file\', \'extensions\' =&gt; \'png, jpg\'],\r\n        ];\r\n    }\r\n    public function upload(){\r\n        if($this-&gt;validate()){\r\n            var_dump($this-&gt;image);\r\n        }else{\r\n            return false;\r\n        }\r\n    }\r\n}\r\n</pre>\r\n<p>Как видим, в модели мы указали свойство $image, которое и будет отвечать за работу с загружаемым изображением. В методе rules использованы правила валидации для получаемого файла, которыми мы сообщаем, что во-первых, поле формы input должно быть корректным загружаемым файлом, а во-вторых, расширения этого файла должны быть png или jpg.\r\n</p>\r\n<p>Ну и, наконец, у нас есть заготовка метода upload, который будет проверять, пройдена ли валидация, и пока что просто распечатывать на экран содержимое обеъекта.\r\n</p>\r\n<p>Далее нам, конечно же, понадобится контроллер и представление. Давайте в классе SiteController создадим действие actionUpload, в котором и получим объект модели.\r\n</p>\r\n<pre>use app\\models\\UploadImage;\r\nuse yii\\web\\UploadedFile;\r\n&lt;span class=\"redactor-invisible-space\"&gt;\r\n&lt;/span&gt;public function actionUpload(){\r\n    $model = new UploadImage();\r\n    if(Yii::$app-&gt;request-&gt;isPost){\r\n        $model-&gt;image = UploadedFile::getInstance($model, \'image\');\r\n        $model-&gt;upload();\r\n        return;\r\n    }\r\n    return $this-&gt;render(\'upload\', [\'model\' =&gt; $model]);\r\n}\r\n</pre>\r\n<p>В экшене мы создаем объект модели и в свойство $image сохраняем информацию о загруженном файле. Также мы вызываем метод upload() модели, который написали на предыдущем шаге. Теперь создадим несложный вид — upload.php и обратимся к искомой странице с формой (http://yii2/site/upload):\r\n</p>\r\n<pre>&lt;?php\r\nuse yii\\widgets\\ActiveForm;\r\n?&gt;\r\n&lt;?php $form = ActiveForm::begin() ?&gt;\r\n&lt;?= $form-&gt;field($model, \'image\')-&gt;fileInput() ?&gt;\r\n&lt;button&gt;Загрузить&lt;/button&gt;\r\n&lt;?php ActiveForm::end() ?&gt;\r\n</pre>\r\n<p>Обратите внимание! Мы используем последнюю версию фреймворка. До версии 2.0.8 для формы при загрузке файлов обязательно нужно было добавлять атрибут enctype со значением multipart/form-data, вот таким образом:\r\n</p>\r\n<pre>&lt;?php $form = ActiveForm::begin([\'options\' =&gt; [\'enctype\' =&gt; \'multipart/form-data\']]) ?&gt;\r\n</pre>\r\n<p>Теперь этого делать не обязательно, Yii сам добавит необходимый атрибут, если в форме есть поля типа file.\r\n</p>\r\n<p>Ну что же, давайте попробуем загрузить файл через созданную форму. Если мы нигде не ошиблись, тогда метод upload модели распечатает данные загруженного изображения.\r\n</p>\r\n<p>К слову, если это будет не картинка с разрешенными расширениями, тогда мы должны увидеть другую картину:\r\n</p>\r\n<p>Давайте теперь внесем необходимые правки в код, чтобы загрузить и вывести его. Для начала метод upload модели.\r\n</p>\r\n<pre>public function upload(){\r\n    if($this-&gt;validate()){\r\n        $this-&gt;image-&gt;saveAs(\"uploads/{$this-&gt;image-&gt;baseName}.{$this-&gt;image-&gt;extension}\");\r\n    }else{\r\n        return false;\r\n    }\r\n}\r\n</pre>\r\n<p>Здесь мы использовали метод saveAs, который сохранит файл по указанному пути. Мы будем сохранять картинку в папку uploads (создайте эту папку в директории web).\r\n</p>\r\n<p>Теперь контроллер. Мы хотим не только загрузить картинку, но и реализовать ее вывод на экран (на практике, конечно же, нам потребуется сохранить путь к картинке в БД, но это тема отдельной статьи).\r\n</p>\r\n<pre>public function actionUpload(){\r\n    $model = new UploadImage();\r\n    if(Yii::$app-&gt;request-&gt;isPost){\r\n        $model-&gt;image = UploadedFile::getInstance($model, \'image\');\r\n        $model-&gt;upload();\r\n        return $this-&gt;render(\'upload\', [\'model\' =&gt; $model]);\r\n    }\r\n    return $this-&gt;render(\'upload\', [\'model\' =&gt; $model]);\r\n}\r\n</pre>\r\n<p>Ну и представление. Давайте проверим наличие изображения и добавим его вывод перед формой:\r\n</p>\r\n<pre>&lt;?php if($model-&gt;image): ?&gt;\r\n    &lt;img src=\"/uploads/&lt;?= $model-&gt;image?&gt;\" alt=\"\"&gt;\r\n&lt;?php endif; ?&gt;\r\n</pre>\r\n<p>В результате изображение должно быть загружено и успешно выведено сразу после сохранения в папку web\\uploads.\r\n</p>\r\n<p>Как видим, загрузка и вывод изображений в Yii — достаточно простая вещь!\r\n</p>\r\n<p><br>\r\n</p>\r\n<p>Если Вы хотите задать параметры загружаемого изображения или сделать нарезку, тогда просто нужно изменить в модели UploadImage\r\n</p>\r\n\r\n<pre>\r\nuse yii\\imagine\\Image;\r\nuse Imagine\\Gd;\r\nuse Imagine\\Image\\Box;\r\nuse Imagine\\Image\\BoxInterface; \r\n\r\n\r\n	public function upload(){\r\n		if($this->validate() && $this->image){\r\n			$img = $this->image->baseName.\".\".$this->image->extension;\r\n			$fileName = \"uploads/\".$img;\r\n			$newWidth = 200;\r\n			$newHeight = 200;\r\n			$savePath = \"uploads/thumb_\".$img;\r\n\r\n			this->image->saveAs($fileName);\r\n			Image::thumbnail($fileName,$newWidth, $newHeight)->save($savePath , [\'quality\' => 90]);\r\n		}else{\r\n			return false;\r\n		}\r\n	}\r\n<pre>\r\nесли страница браузера виснет при загрузке изображения, просто отключите в php.ini, таким образом ;extension=php_imagick.dll\r\n\r\nподробнее о атрибутах Imagine читайте https://prowebmastering.ru/yii2-ispolyzovanie-klassa-yii-imagine-image-primery.html', 'yii2', 'yii2-images', '2.jpg', 63, 1, 1, 1539518517, 1539614737),
(2, 1, 'Авторизация в Yii2 по e-mail вместо username', 'Для авторизации на сайте мне больше нравится использование e-mail пользователя в качестве логина вместо ника, по умолчанию в yii2 используется ник в качестве логина. Исправить это довольно просто.', '<p>Начнем с модели /models/User.php, в ней необходимо добавить метод findByEmail для поиска пользователя по e-mail:</p><pre>public static function findByEmail($email)\r\n{\r\n    return static::findOne([\'email\' =&gt; $email, \'status\' =&gt; self::STATUS_ACTIVE]);\r\n}\r\n</pre><p>Далее в моделе /models/LoginForm.php меняем своойство (переменную) $username на $email в методе rules добавляем правило обработки e-mail [[\'email\'], \'email\'] и в методе getUser() меняем вызов User::findByUsername($this-&gt;username) на User::findByEmail($this-&gt;email), вот что получится:</p><pre>&lt;?php\r\n \r\nnamespace app\\models;\r\n \r\nuse Yii;\r\nuse yii\\base\\Model;\r\n \r\n/**\r\n * LoginForm is the model behind the login form.\r\n *\r\n * @property User|null $user This property is read-only.\r\n *\r\n */\r\nclass LoginForm extends Model\r\n{\r\n    public $email;\r\n    public $password;\r\n    public $rememberMe = true;\r\n    private $_user = false;\r\n \r\n    /**\r\n     * @return array the validation rules.\r\n     */\r\n    public function rules()\r\n    {\r\n        return [\r\n            // username and password are both required\r\n            [[\'email\', \'password\'], \'required\'],\r\n            [[\'email\'], \'email\'],\r\n            // rememberMe must be a boolean value\r\n            [\'rememberMe\', \'boolean\'],\r\n            // password is validated by validatePassword()\r\n            [\'password\', \'validatePassword\'],\r\n        ];\r\n    }\r\n \r\n    /**\r\n     * Validates the password.\r\n     * This method serves as the inline validation for password.\r\n     *\r\n     * @param string $attribute the attribute currently being validated\r\n     * @param array $params the additional name-value pairs given in the rule\r\n     */\r\n    public function validatePassword($attribute, $params)\r\n    {\r\n        if (!$this-&gt;hasErrors()) {\r\n            $user = $this-&gt;getUser();\r\n \r\n            if (!$user || !$user-&gt;validatePassword($this-&gt;password)) {\r\n                $this-&gt;addError($attribute, \'Incorrect username or password.\');\r\n            }\r\n \r\n        }\r\n    }\r\n \r\n    /**\r\n     * Logs in a user using the provided username and password.\r\n     * @return bool whether the user is logged in successfully\r\n     */\r\n    public function login()\r\n    {\r\n        if ($this-&gt;validate()) {\r\n            return Yii::$app-&gt;user-&gt;login($this-&gt;getUser(), $this-&gt;rememberMe ? 3600*24*30 : 0);\r\n        }\r\n        return false;\r\n    }\r\n \r\n    /**\r\n     * Finds user by [[email]]\r\n     *\r\n     * @return User|null\r\n     */\r\n    public function getUser()\r\n    {\r\n        if ($this-&gt;_user === false) {\r\n            $this-&gt;_user = User::findByEmail($this-&gt;email);\r\n        }\r\n        return $this-&gt;_user;\r\n    }\r\n \r\n}\r\n</pre><p>И последнее, в представлении /views/site/login.php меняем поле username на email:</p><pre>&lt;?= $form-&gt;field($model, \'email\')-&gt;textInput([\'autofocus\' =&gt; true]) ?&gt;\r\n</pre>', 'yii2, user', 'yii2-e-mail-username', '1.jpg', 61, 1, 1, 1539613450, 1539614718),
(3, 1, 'Yii2 - подтверждение регистрации на сайте по email.', 'Описание конечного результата: \r\nпосле заполнении формы на странице регистрации, пользователь перенаправляется на главную страницу, где ему выводится флэш сообщение «Проверьте свою электронную почту для подтверждения регистрации».', '<p>Описание конечного результата:\r\n</p><p>после заполнении формы на странице регистрации, пользователь перенаправляется на главную страницу, где ему выводится флэш сообщение «Проверьте свою электронную почту для подтверждения регистрации» (тексты по-умолчанию на английском). Пользователю отправляется письмо со ссылкой, перейдя по которой, в базе данных его статус меняется на «активен», после чего он сможет залогиниться на сайте. Таким образом проверяем указанный им, при регистрации, электронный адрес.\r\n</p><p>Процесс состоит из нескольких простых пунктов и используется для фреймворка yii2 версии advanced.\r\n</p><p>1.\r\n</p><p>В файле миграции которая создает таблицу user («из-коробки» находится в console/migrations/m130524_201442_init.php) меняем значение для поля \"status\" на \"0\", что бы, по-умолчанию, пользователь считался не активным:\r\n</p><pre>\'status\' =&gt; $this-&gt;smallInteger()-&gt;notNull()-&gt;defaultValue(0),\r\n</pre><p>2.\r\n</p><p>Создаем новую миграцию – добавляем поле \'email_confirm_token\' для хранения токена в таблицу user:\r\n</p><pre>&lt;?php\r\nuse yii\\db\\Migration;\r\nclass m180317_182650_add_user_email_confirm_token extends Migration\r\n{\r\n    public function up()\r\n    {\r\n        $this-&gt;addColumn(\'{{%user}}\', \'email_confirm_token\', $this-&gt;string()-&gt;unique()-&gt;after(\'email\'));\r\n    }\r\n    public function down()\r\n    {\r\n        $this-&gt;dropColumn(\'{{%user}}\', \'email_confirm_token\');\r\n    }\r\n}\r\n</pre><p>При регистрации будет сгенерирована случайная строка и сохранена в это поле. Потом она будет отправлена пользователю на его электронный адрес в ссылке для перехода.\r\n</p><p>3.\r\n</p><p>Корректируем «модель» (сущность) User. По-умолчанию в фреймворке версии advanced уже создан файл User.php в common/models.\r\n</p><p>В начале класса добавляем константу:\r\n</p><pre>const STATUS_WAIT = 5;\r\n</pre><p>Данный статус будет означать, что пользователь зарегистрировался но еще не подтвердил свой email.\r\n</p><p>Меняем метод rules:\r\n</p><pre>public function rules()\r\n{\r\n    return [\r\n        [\'status\', \'in\', \'range\' =&gt; [self::STATUS_DELETED, self::STATUS_WAIT, self::STATUS_ACTIVE]],\r\n    ];\r\n}\r\n</pre><p>Метод findByUsername меняем на:\r\n</p><pre>public static function findByUsername($username)\r\n{\r\n    return static::findOne([\'username\' =&gt; $username]);\r\n}\r\n</pre><p>4.\r\n</p><p>Контроллер, действие «signup».\r\n</p><p>По-умолчанию, за регистрацию пользователей отвечает метод actionSignup в frontend/controllers/SiteController.php\r\n</p><p>Меняем данный метод таким образом:\r\n</p><pre>public function actionSignup()\r\n{\r\n    $form = new SignupForm();\r\n    if ($form-&gt;load(Yii::$app-&gt;request-&gt;post()) &amp;&amp; $form-&gt;validate()) {\r\n        $signupService = new SignupService();\r\n\r\n        try{\r\n            $user = $signupService-&gt;signup($form);\r\n            Yii::$app-&gt;session-&gt;setFlash(\'success\', \'Check your email to confirm the registration.\');\r\n            $signupService-&gt;sentEmailConfirm($user);\r\n            return $this-&gt;goHome();\r\n        } catch (\\RuntimeException $e){\r\n            Yii::$app-&gt;errorHandler-&gt;logException($e);\r\n            Yii::$app-&gt;session-&gt;setFlash(\'error\', $e-&gt;getMessage());\r\n        }\r\n    }\r\n\r\n    return $this-&gt;render(\'signup\', [\r\n        \'model\' =&gt; $form,\r\n    ]);\r\n}\r\n</pre><p>Строкой\r\n</p><p>$form = new SignupForm();\r\n</p><p>подключаем класс валидации формы. Далее, пытаемся загрузить данные из POST запроса и если они прошли проверку, то создается объект класса-сервиса, который и будет заниматься регистрацией.\r\n</p><p>5.\r\n</p><p>Сервис регистрации.\r\n</p><p>Основную логику касающуюся регистрации пользователей вынесем в отдельный класс.\r\n</p><p>Файл common/services/auth/SignupService.php:\r\n</p><pre>&lt;?php\r\nnamespace common\\services\\auth;\r\nuse Yii;\r\nuse common\\models\\User;\r\nuse frontend\\models\\SignupForm;\r\nclass SignupService\r\n{\r\n    public function signup(SignupForm $form)\r\n    {\r\n        $user = new User();\r\n        $user-&gt;username = $form-&gt;username;\r\n        $user-&gt;generateAuthKey();\r\n        $user-&gt;setPassword($form-&gt;password);\r\n        $user-&gt;email = $form-&gt;email;\r\n        $user-&gt;email_confirm_token = Yii::$app-&gt;security-&gt;generateRandomString();\r\n        $user-&gt;status = User::STATUS_WAIT;\r\n        if(!$user-&gt;save()){\r\n            throw new \\RuntimeException(\'Saving error.\');\r\n        }\r\n        return $user;\r\n    }\r\n    public function sentEmailConfirm(User $user)\r\n    {\r\n        $email = $user-&gt;email;\r\n        $sent = Yii::$app-&gt;mailer\r\n            -&gt;compose(\r\n                [\'html\' =&gt; \'user-signup-comfirm-html\', \'text\' =&gt; \'user-signup-comfirm-text\'],\r\n                [\'user\' =&gt; $user])\r\n            -&gt;setTo($email)\r\n            -&gt;setFrom(Yii::$app-&gt;params[\'adminEmail\'])\r\n            -&gt;setSubject(\'Confirmation of registration\')\r\n            -&gt;send();\r\n        if (!$sent) {\r\n            throw new \\RuntimeException(\'Sending error.\');\r\n        }\r\n    }\r\n    public function confirmation($token)\r\n    {\r\n        if (empty($token)) {\r\n            throw new \\DomainException(\'Empty confirm token.\');\r\n        }\r\n        $user = User::findOne([\'email_confirm_token\' =&gt; $token]);\r\n        if (!$user) {\r\n            throw new \\DomainException(\'User is not found.\');\r\n        }\r\n        $user-&gt;email_confirm_token = null;\r\n        $user-&gt;status = User::STATUS_ACTIVE;\r\n        if (!$user-&gt;save()) {\r\n            throw new \\RuntimeException(\'Saving error.\');\r\n        }\r\n        if (!Yii::$app-&gt;getUser()-&gt;login($user)){\r\n            throw new \\RuntimeException(\'Error authentication.\');\r\n        }\r\n    }\r\n}\r\n</pre><p>Учтите, что пространства имен для User и SignupForm (сверху для директивы use) у вас будут отличаться.\r\n</p><p>Метод signup будет заниматься созданием нового пользователя в базе данных. Данный метод заменяет одноименный метод из SignupForm (по-умолчанию в frontend\\models\\SignupForm.php), поэтому от туда его можно удалить.\r\n</p><p>Метод sentEmailConfirm отправляет регистрирующемуся пользователю письмо со ссылкой для подтверждения регистрации.\r\n</p><p>Метод confirmation будет использоваться для проверки токена при переходе пользователя по ссылке подтверждения (ссылка будет содержать данный параметр, который будет найден в базе данных). Если токен верный, то поле email_confirm_token очищается:\r\n</p><p>$user-&gt;email_confirm_token = null;\r\n</p><p>и пользователь получает статус «акивен»:\r\n</p><p>$user-&gt;status = User::STATUS_ACTIVE;\r\n</p><p>Вызовы этих методов сервиса в контроллере обернуты в блок try-catch, и в случае ошибки пользователь увидит соответствующее флэш сообщение, так же ошибки запишутся в логи для администратора.\r\n</p><p>6.\r\n</p><p>Письма подтверждения регистрации.\r\n</p><p>Метод sentEmailConfirm класса SignupService отправляет письма пользователю для подтверждения регистрации. При этом используются шаблоны с текстом для html версии - \'user-signup-comfirm-html\' и простой текстовой версии – \'user-signup-comfirm-text\'. Создаем соответствующие файлы:\r\n</p><p>Файл common/mail/user-signup-comfirm-html.php:\r\n</p><pre>&lt;?php\r\nuse yii\\helpers\\Html;\r\n/* @var $user \\common\\entities\\User */\r\n$confirmLink = Yii::$app-&gt;urlManager-&gt;createAbsoluteUrl([\'site/signup-confirm\', \'token\' =&gt; $user-&gt;email_confirm_token]);\r\n?&gt;\r\n&lt;div class=\"password-reset\"&gt;\r\n    &lt;p&gt;Hello &lt;?= Html::encode($user-&gt;username) ?&gt;,&lt;/p&gt;\r\n    &lt;p&gt;Follow the link below to confirm your email:&lt;/p&gt;\r\n    &lt;p&gt;&lt;?= Html::a(Html::encode($confirmLink), $confirmLink) ?&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n</pre><p>Файл common/mail/user-signup-comfirm-text.php:\r\n</p><pre>&lt;?php\r\n/* @var $user \\common\\entities\\User */\r\n$confirmLink = Yii::$app-&gt;urlManager-&gt;createAbsoluteUrl([\'site/signup-confirm\', \'token\' =&gt; $user-&gt;email_confirm_token]);\r\n?&gt;\r\nHello &lt;?= $user-&gt;username ?&gt;,\r\nFollow the link below to confirm your email:\r\n&lt;?= $confirmLink ?&gt;\r\n</pre><p>Пользователь получит такой текст сообщения:\r\n</p><p>Hello Name,\r\n</p><p>Follow the link below to confirm your email:\r\n</p><p><a href=\"http://example.com/site/signup-confirm?token=SjfUrPihsY2peMqb7XB45_TRfBRvadRu\">http://example.com/site/signup-confirm?token=SjfUr...</a>\r\n</p><p>Сама ссылка может отличаться в зависимости от установленных правил маршрутизации в вашем приложении.\r\n</p><p>Как видим, обрабатывать переход по ней будет SiteController с действием signup-confirm.\r\n</p><p>7.\r\n</p><p>Контроллер, действие «signup-confirm».\r\n</p><pre>public function actionSignupConfirm($token)\r\n{\r\n    $signupService = new SignupService();\r\n    try{\r\n        $signupService-&gt;confirmation($token);\r\n        Yii::$app-&gt;session-&gt;setFlash(\'success\', \'You have successfully confirmed your registration.\');\r\n    } catch (\\Exception $e){\r\n        Yii::$app-&gt;errorHandler-&gt;logException($e);\r\n        Yii::$app-&gt;session-&gt;setFlash(\'error\', $e-&gt;getMessage());\r\n    }\r\n    return $this-&gt;goHome();\r\n}\r\n</pre><p>Данное действие использует все тот-же сервис для регистрации, вызывая его метод confirmation.\r\n</p><p>8.\r\n</p><p>Контроллер, действие «login».\r\n</p><p>На данном этапе все уже работает, но может возникнуть ситуация, что пользователь будет пытаться залогиниться еще до того, как подтвердит свой email. Если не поправить действие login, то он увидит сообщение «Incorrect username or password.» что не правильно. Вместо этого покажем ему «To complete the registration, confirm your email. Check your email.». Для этого меняем:\r\n</p><pre>public function actionLogin()\r\n{\r\n    if (!Yii::$app-&gt;user-&gt;isGuest) {\r\n        return $this-&gt;goHome();\r\n    }\r\n    $form = new LoginForm();\r\n    if ($form-&gt;load(Yii::$app-&gt;request-&gt;post())) {\r\n        try{\r\n            if($form-&gt;login()){\r\n                return $this-&gt;goBack();\r\n            }\r\n        } catch (\\DomainException $e){\r\n            Yii::$app-&gt;session-&gt;setFlash(\'error\', $e-&gt;getMessage());\r\n   return $this-&gt;goHome();\r\n        }\r\n    }\r\n    return $this-&gt;render(\'login\', [\r\n        \'model\' =&gt; $form,\r\n    ]);\r\n}\r\n</pre><p>Так же в моделе формы – класс LoginForm (по-умолчанию находится в common/models/LoginForm.php) меняем метод login:\r\n</p><pre>public function login()\r\n{\r\n    if ($this-&gt;validate()) {\r\n        $user = $this-&gt;getUser();\r\n        if($user-&gt;status === User::STATUS_ACTIVE){\r\n            return Yii::$app-&gt;user-&gt;login($user, $this-&gt;rememberMe ? 3600 * 24 * 30 : 0);\r\n        }\r\n        if($user-&gt;status === User::STATUS_WAIT){\r\n            throw new \\DomainException(\'To complete the registration, confirm your email. Check your email.\');\r\n        }\r\n    } else {\r\n        return false;\r\n    }\r\n}\r\n</pre><p>Это все. Не забудьте в контроллере подключить:\r\n</p><pre>use common\\services\\auth\\SignupService;\r\n</pre>', 'yii2, user', 'yii2-email-register', '2.jpg', 20, 1, 1, 1539614478, 1539614698),
(4, 1, 'Как убрать web и настроить ЧПУ в Yii2?', 'В этом посте настроим ЧПУ и рассмотрим как избавиться от директории «web» в URL-адресах при обращении к страницам сайта для «basic» и «advanced» приложений.', '<p>В этом посте настроим ЧПУ и рассмотрим как избавиться от директории «web» в URL-адресах при обращении к страницам сайта для «basic» и «advanced» приложений !!!</p><p>После установки фреймворка главная страница сайта («basic» приложения) доступна по адресу http://yii2/web/ («yii2» это локальный домен, созданный в Open Server), но главная страница должна быть доступна по адресу http://yii2, то есть когда мы обращаемся к доменному имени, но пока при обращении к домену видим листинг файлов и папок.\r\n</p><p>Листинг папок и файлов при обращении к корню сайта !!!</p><p>Почему так происходит? Потому что в директории «web» расположена общедоступная часть приложения, в ней находится входной файл index.php всего приложения, и в нее складываются все публичные файлы (стили, скрипты, картинки, шрифты и т.д.).\r\n</p><p>Необходимо убрать эту директорию из УРЛ-адресов, но сделать так, чтобы все запросы по-прежнему уходили в папку «web».\r\n</p><p>Для «basic»\r\n</p><p>Создаем два файла .htaccess: один файл в директории «web», другой в корне сайта.\r\n</p><p>В файле, созданном в папке «web», помещаем следующее:\r\n</p><pre>RewriteBase /\r\n# Если это папка или файл, открываем его\r\nRewriteCond %{REQUEST_FILENAME} !-f\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\n# В противном случае перенаправляем на index.php\r\nRewriteRule . index.php\r\nЗдесь все просто, если запрос не является папкой или файлом, тогда запрос перенаправляется на index.php.\r\n</pre><p>В корневом .htaccess необходимо отправлять все запросы в папку «web», тут можно использовать два варианта. Первый короткий:\r\n</p><pre>RewriteEngine on\r\nRewriteRule ^(.+)?$ /web/$1\r\n</pre><p>Такое перенаправление отлично работает на чистом Apache, а вот на хостингах, использующих связку Apache + Nginx, могут возникнуть проблемы, поэтому я рекомендую всегда использовать более развернутое правило перенаправления.\r\n</p><pre>Options +FollowSymLinks\r\nIndexIgnore */*\r\nRewriteEngine on\r\nRewriteCond %{REQUEST_URI} !^/(web)\r\nRewriteRule ^assets/(.*)$ /web/assets/$1 [L]\r\nRewriteRule ^css/(.*)$ web/css/$1 [L]\r\nRewriteRule ^fonts/(.*)$ web/fonts/$1 [L]\r\nRewriteRule ^js/(.*)$ web/js/$1 [L]\r\nRewriteRule ^images/(.*)$ web/images/$1 [L]\r\nRewriteRule ^robots.txt web/robots.txt [L]\r\n# Все что находится в папке web, что нужно показать\r\nRewriteRule (.*) /web/$1\r\nRewriteCond %{REQUEST_FILENAME} !-f\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\nRewriteRule . /web/index.php\r\n</pre><p>Для «advanced» !!!</p><p>Создаем три файла .htaccess: первый в корне, второй в «frontend/web», третий в «backend/web».\r\n</p><p>В файлы, находящиеся в «backend/web» и «frontend/web», помещаем одинаковое уже знакомое правило:\r\n</p><pre># Если это папка или файл, открываем его\r\nRewriteCond %{REQUEST_FILENAME} !-f\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\n# В противном случае перенаправляем на index.php\r\nRewriteRule . index.php\r\n</pre><p>В корневой .htaccess помещаем следующий код:\r\n</p><pre>Options +FollowSymlinks\r\nIndexIgnore */*\r\nRewriteEngine On\r\nRewriteCond %{REQUEST_URI} ^/(admin)\r\nRewriteRule ^admin/assets/(.*)$ backend/web/assets/$1 [L]\r\nRewriteRule ^admin/css/(.*)$ backend/web/css/$1 [L]\r\nRewriteCond %{REQUEST_URI} !^/backend/web/(assets|css)/\r\nRewriteCond %{REQUEST_URI} ^/(admin)\r\nRewriteRule ^.*$ backend/web/index.php [L]\r\nRewriteCond %{REQUEST_URI} ^/(assets|css|js|images|fonts|uploads|robots.txt)\r\nRewriteRule ^assets/(.*)$ frontend/web/assets/$1 [L]\r\nRewriteRule ^css/(.*)$ frontend/web/css/$1 [L]\r\nRewriteRule ^js/(.*)$ frontend/web/js/$1 [L]\r\nRewriteRule ^images/(.*)$ frontend/web/images/$1 [L]\r\nRewriteRule ^fonts/(.*)$ frontend/web/fonts/$1 [L]\r\nRewriteRule ^fonts/(.*)$ frontend/web/uploads/$1 [L]\r\nRewriteRule ^robots.txt/(.*)$ frontend/web/robots.txt/$1 [L]\r\nRewriteRule ^(.*)$ frontend/web/$1 [L]\r\nRewriteCond %{REQUEST_URI} !^/(frontend|backend)/web/(assets|css|js)/\r\nRewriteCond %{REQUEST_URI} !index.php\r\nRewriteCond %{REQUEST_FILENAME} !-f [OR]\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\nRewriteRule ^.*$ frontend/web/index.php\r\n</pre><p>Принцип такой же, как и для «basic», просто отдельно прописываем правила для «frontend» и «backend», а все запросы на публичные файлы отправляем на «frontend».\r\n</p><p>Настройка ЧПУ в Yii2 приложениях !!!</p><p>Из коробки в фреймворке ЧПУ выключены, чтобы их включить для «basic» необходимо открыть файл web.php, который находится в папке «config», в массиве «components» находим вложенный массив «request» и вставляем следующую настройку:\r\n</p><pre>\'baseUrl\' =&gt; \'\',\r\n</pre><p>Должно получиться так, как показано на скриншоте ниже.\r\n</p><p>Вставляем пустой baseUrl в массив request\r\n</p><p>В том же массиве «components» находим и раскомментируем следующий код:\r\n</p><pre>\'urlManager\' =&gt; [\r\n    \'enablePrettyUrl\' =&gt; true,\r\n    \'showScriptName\' =&gt; false,\r\n    \'rules\' =&gt; [\r\n    ],\r\n],\r\n</pre><p>Если данный код отсутствует, то просто вставляем его в массив «components» и сохраняем файл.\r\n</p><p>Для «advanced» нужно проделать тоже самое в файле main.php, который находится в папке «frontend/config», а в main.php, папки «backend/config», нужно еще изменить  baseUrl:\r\n</p><pre>\'baseUrl\' =&gt; \'/admin\'\r\n</pre>', 'yii2, cpu', 'web-yii2', '4.png', 185, 1, 1, 1539615294, 1546728011);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_tag`
--

CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_tag`
--

INSERT INTO `blog_tag` (`id`, `name`, `frequency`) VALUES
(1, 'yii2', 4),
(2, 'yii2 user', 4),
(3, 'user', 1),
(4, 'cpu', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1539258875),
('m130524_201442_init', 1539258879),
('m180317_182650_add_user_email_confirm_token', 1539541407),
('m180406_201480_blog_init', 1539260145),
('m190108_182853_profile', 1546972892);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `avatar` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `firstname`, `lastname`, `phone`, `birthdate`, `avatar`, `email_confirm_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'IWuLKreGm-avakKEN_y58ReHmkyaLwZa', '$2y$13$bYbw0W7yTHpHGDvFAjJfRulWiw0Z7AfWgkV/he6ozKOgbHqJTUNgK', 'Yp3ZMJ3id893B4_wc67psSRRAj-UdHYI_1539596333', 'admin@admin.ru', 'Vlad', 'Bashlykov', '+7(965)-165-04-96', '1987-04-26', '1.png', NULL, 10, 1539281788, 1539596333);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Индексы таблицы `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_nav` (`is_nav`),
  ADD KEY `sort_order` (`sort_order`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `FK_post_user` (`user_id`);

--
-- Индексы таблицы `blog_tag`
--
ALTER TABLE `blog_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frequency` (`frequency`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`),
  ADD UNIQUE KEY `email_confirm_token` (`email_confirm_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `blog_tag`
--
ALTER TABLE `blog_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `FK_post_category` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
