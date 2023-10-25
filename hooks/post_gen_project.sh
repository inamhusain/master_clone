#!/bin/bash
initialize_git() {
    git init
    git add -A
}

connect_git_repo() {
    git remote add origin {{ cookiecutter.repo_link }}
}

update_project_permissions() {
    cd ..
    chmod -R 777 "{{ cookiecutter.repo_name }}"
    cd "{{ cookiecutter.repo_name }}"
}

update_project_permissions
# check_theme_flag
flutter clean
flutter pub get
# flutter pub global activate flutter_gen
flutter pub add envied
flutter pub add --dev envied_generator
flutter pub add --dev build_runner

dart pub run build_runner build --delete-conflicting-outputs
cd ios/
pod install
cd ..
dart format lib
initialize_git
{%- if cookiecutter.repo_link != "NA" -%}
connect_git_repo
{% endif %}
git config core.hooksPath .githooks/