# README

Gems: 

- Annotate - дополнительная иформация(поля моделей);
- jquery-rails - создание и добавление постов, комментариев без перезагрузки страницы;
- Active Storage - вложение файлов для постов;
- active_storage_validations - валидация для размера вложенных файлов.
- Rspec/Capybara/ShouldaMatchers/FactoryBot - тестирование

Запуск проекта:
- $ `git clone https://github.com/KhIgorLe/blog.git`
- $ `bundle install`
- $ `cp config/database.yml.sample config/database.yml`
- $ `rails db:create`
- $ `rails db:schema:load`
