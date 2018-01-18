# 프로젝트 소개

본 프로젝트는 devise gem 을 설치하는 법을 가이드합니다.
* devise gem github: https://github.com/plataformatec/devise

## bootstrap 설치 
Gemfile 에 bootstrap 관련 gem 을 추가합니다.
```
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7' -- 버전은 가능한 최신 버전으로 명시합니다.
```

그런 뒤 bundle install 을 실행합니다.
```
$ bundle install
```

/assets/stylesheets 하위 폴더에 _variables.sass 을 생성하고, application.scss 에 import 합니다.

```
@import "bootstrap";
@import "variables";
```


## devise gem 설치

Gemfile 에 devise 관련 gem 을 추가합니다.
```
#devise
gem 'auto_strip_attributes'  -- 입력된 값의 공백을 지워주는 역할을 합니다
gem 'devise', '~> 4.4'       -- 버전을 명시하도록 합니다
gem 'devise-bootstrap-views'
```

그런 뒤 bundle install 을 실행합니다.
```
$ bundle install
```

devise 를 설치합니다.
```
$ bin/rails generate devise:install
```


## Application Controller 수정

application_controller.rb 3 ~ 16 라인을 복사하여, devise_controller 로 들어 올 경우의 템플릿과 파라미터 등을 지정해줍니다.


## Model 설정

devise 를 적용할 model 을 만듭니다.(여기서는 User 에 만듭니다)
```
$ bin/rails generate devise User
```

생성된 migrate 파일(2018116042206_devise_create_users.rb)을 확인하며 추가해야 할 컬럼을 추가합니다.
```
t.string :nickname, null: false
```

user.rb 7 ~ 23 라인을 복사하여 nickname 컬럼과 관련된 validate 로직을 user.rb에 추가합니다.
(위에서 nickname 컬럼을 추가하지 않았다면 따르지 않아도 됩니다.)


## Layout 생성

views/layouts 하위에 devise.html.haml 을 생성합니다.


## Devise 관련 View 생성

커맨드에서 아래 명령어를 실행하여 한국어 파일을 생성합니다.
```
$ bin/rails g devise:views:locale ko
```

application.rb 에 locale config 를 추가합니다.
```
config.time_zone = 'Asia/Seoul'
config.i18n.available_locales = [:en, :ko]
config.i18n.default_locale = :ko
config.autoload_paths << Rails.root.join('lib')
```

그런 후 bootstrap 이 적용되어 있는 devise view 생성을 위해 아래 명령어를 커맨드에서 실행합니다.
```
$ bin/rails g devise:views:bootstrap_haml_templates
```


## 로그인, 로그아웃을 만듭니다.

