import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_content.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_locale.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/repositories/site_content_repository.dart';

class LocalSiteContentRepository implements SiteContentRepository {
  @override
  SiteContent byLocale(SiteLocale locale) {
    return switch (locale) {
      SiteLocale.ru => _ru,
      SiteLocale.ky => _ky,
      SiteLocale.en => _en,
    };
  }
}

const _ru = SiteContent(
  languageLabel: 'Язык',
  heroTitle: 'Изучайте кыргызский язык легко и с интересом',
  heroSubtitle:
      'KyrgyzTili Learn & Play помогает детям и взрослым учить слова и выражения через игровую практику, короткие сессии и живой прогресс.',
  aboutTitle: 'О проекте',
  aboutBody:
      'Это образовательный проект с акцентом на ежедневную практику. Приложение объединяет обучение словам, повторение и игровые форматы.',
  linksTitle: 'Скачать приложение',
  linksBody:
      'Официальные ссылки на мобильные версии приложения в Google Play и App Store.',
  contactsTitle: 'Контакты',
  contactsBody: 'Для сотрудничества, поддержки и предложений свяжитесь с нами.',
  privacyTitle: 'Политика конфиденциальности',
  termsTitle: 'Условия использования',
  openLegalPageLabel: 'Открыть страницу',
  storeAndroid: 'Скачать для Android',
  storeIos: 'Скачать для iOS',
  contactEmail: 'Написать на email',
  contactTelegram: 'Написать в Telegram',
  contactInstagram: 'Instagram',
  footer: 'Все права защищены.',
  privacyText: '''
# Политика конфиденциальности
**KyrgyzTili Learn & Play**

Последнее обновление: 08.02.2026

---

## 1. Общие положения
Настоящая Политика конфиденциальности описывает, какие данные собираются и используются в мобильном приложении **KyrgyzTili Learn & Play** (далее - «Приложение»), а также каким образом обеспечивается их защита.

Используя Приложение, вы соглашаетесь с условиями данной Политики конфиденциальности.

---

## 2. Какие данные мы собираем
### 2.1 Данные аккаунта
Приложение поддерживает следующие способы входа:
- анонимная регистрация
- вход через Google
- вход через Apple

В зависимости от выбранного способа, мы можем получать:
- уникальный идентификатор пользователя (UID)
- имя профиля (если предоставлено)
- техническую информацию, необходимую для авторизации

**Мы не собираем и не храним пароли пользователей.**

---

### 2.2 Данные об использовании приложения
Для улучшения работы Приложения могут сохраняться:
- прогресс обучения (изученные слова, ошибки, достижения)
- статистика активности (время использования, количество сессий)
- внутриигровые показатели (очки опыта, уровни)

Эти данные используются **исключительно для работы функционала Приложения**.

---

### 2.3 Реклама
В Приложении **может отображаться реклама**.

Рекламные сети могут автоматически собирать:
- обезличенные данные об устройстве
- идентификаторы рекламы
- данные о взаимодействии с рекламой

Сбор и обработка таких данных регулируется политиками соответствующих рекламных сервисов.

---

### 2.4 Платежи и поддержка проекта
В Приложении могут быть доступны единоразовые платежи (донаты) в качестве поддержки проекта.
Мы не обрабатываем и не храним данные банковских карт или платёжную информацию.

Все платежи обрабатываются через официальные платёжные системы магазинов приложений (Google Play / App Store).

---

## 3. Как мы используем данные
Собранные данные используются для:
- обеспечения работы Приложения
- сохранения прогресса пользователя
- улучшения качества обучения
- аналитики и исправления ошибок
- отображения рекламы (если включена)

---

## 4. Хранение и защита данных
Данные пользователей хранятся с использованием облачных сервисов (например, Firebase) и защищаются стандартными мерами безопасности.

Мы принимаем разумные меры для защиты данных от несанкционированного доступа, изменения или удаления.

---

## 5. Передача данных третьим лицам
Мы не продаём и не передаём персональные данные пользователей третьим лицам, за исключением случаев:
- когда это необходимо для работы сервисов (авторизация, реклама, аналитика)
- когда этого требует законодательство

---

## 6. Удаление аккаунта и данных
Пользователь может в любой момент:
- выйти из аккаунта
- удалить аккаунт и связанные с ним данные через настройки Приложения

После удаления аккаунта данные пользователя удаляются без возможности восстановления, за исключением случаев, предусмотренных законом.

---

## 7. Конфиденциальность детей
Приложение не предназначено для сбора персональных данных детей младше 13 лет без согласия родителей.

Если вы считаете, что данные были собраны ошибочно, пожалуйста, свяжитесь с нами.

---

## 8. Изменения в политике
Мы можем периодически обновлять данную Политику конфиденциальности.

Актуальная версия всегда будет доступна по месту её публикации.

---

## 9. Контактная информация
Если у вас есть вопросы или предложения по поводу Политики конфиденциальности, вы можете связаться с нами:

Email: isafiulin00@gmail.com
''',
  termsText: '''
# Условия использования
**Kyrgyz Tili Learn and Play**

Дата последнего обновления: 08.02.2026

Настоящие Условия использования (далее - «Условия») регулируют порядок использования мобильного приложения Kyrgyz Tili Learn and Play (далее - «Приложение»).

Используя Приложение, вы подтверждаете, что прочитали, поняли и соглашаетесь с настоящими Условиями. Если вы не согласны с Условиями, пожалуйста, не используйте Приложение.

---

## 1. Описание сервиса
Kyrgyz Tili Learn and Play - это образовательное мобильное приложение, предназначенное для изучения кыргызского языка в игровой форме (флешкарты, игровые режимы, повторение слов и другие функции).

Приложение предоставляется «как есть» и может обновляться, изменяться или дополняться без предварительного уведомления.

---

## 2. Регистрация и аккаунты
Для использования Приложения возможны следующие способы входа:
- анонимное использование
- вход через Google
- вход через Apple

Пользователь несёт ответственность за сохранность доступа к своему аккаунту и за все действия, совершённые в рамках своего аккаунта.

---

## 3. Платежи и поддержка проекта
В Приложении могут быть доступны:
- единоразовые добровольные платежи в качестве поддержки проекта
- другие платные функции (если будут добавлены в будущем)

Все платежи являются необязательными и не влияют на базовую доступность Приложения, если иное не указано отдельно.

Возвраты средств регулируются правилами соответствующих магазинов (Google Play / App Store).

---

## 4. Реклама
В Приложении может отображаться реклама.

Реклама может быть предоставлена сторонними рекламными платформами (например, Google AdMob) и отображаться в соответствии с их правилами и политиками.

Разработчик не несёт ответственности за содержание сторонней рекламы.

---

## 5. Использование контента
Всё содержимое Приложения (тексты, дизайн, интерфейс, логика, структура, графические элементы) является собственностью разработчика или используется на законных основаниях.

Запрещается:
- копировать, распространять или изменять контент Приложения без разрешения
- использовать Приложение в незаконных целях
- предпринимать попытки взлома, обхода ограничений или вмешательства в работу Приложения

---

## 6. Ограничение ответственности
Приложение предоставляется «как есть», без каких-либо гарантий.

Разработчик не гарантирует:
- отсутствие ошибок или сбоев
- соответствие Приложения ожиданиям пользователя
- непрерывную и безошибочную работу

Разработчик не несёт ответственности за возможные убытки, возникшие в результате использования или невозможности использования Приложения.

---

## 7. Прекращение доступа
Разработчик оставляет за собой право:
- временно или полностью ограничить доступ к Приложению
- удалить аккаунт пользователя в случае нарушения Условий или законодательства

Пользователь может прекратить использование Приложения в любой момент, удалив его со своего устройства.

---

## 8. Изменения условий
Разработчик может в любое время обновлять настоящие Условия.

Актуальная версия всегда доступна в Приложении.

Продолжение использования Приложения после внесения изменений означает согласие с обновленными Условиями.

---

## 9. Контактная информация
Если у вас есть вопросы или предложения, вы можете связаться с разработчиком:

Email: isafiulin00@gmail.com

---

## 10. Применимое право
Настоящие Условия регулируются и толкуются в соответствии с применимым законодательством, в зависимости от юрисдикции пользователя и требований магазинов приложений.
''',
);

const _ky = SiteContent(
  languageLabel: 'Тил',
  heroTitle: 'Кыргыз тилин жеңил жана кызыктуу үйрөнүңүз',
  heroSubtitle:
      'KyrgyzTili Learn & Play балдарга жана чоңдорго сөздөрдү оюн форматында, кыска машыгуулар жана туруктуу прогресс аркылуу үйрөнүүгө жардам берет.',
  aboutTitle: 'Долбоор жөнүндө',
  aboutBody:
      'Бул күн сайын машыгууга багытталган билим берүү долбоору. Колдонмо сөз үйрөнүү, кайталоо жана оюн форматтарын бириктирет.',
  linksTitle: 'Колдонмону жүктөө',
  linksBody:
      'Google Play жана App Store дүкөндөрүндөгү расмий мобилдик версияларына шилтемелер.',
  contactsTitle: 'Байланыш',
  contactsBody: 'Кызматташуу, колдоо жана сунуштар үчүн бизге жазыңыз.',
  privacyTitle: 'Купуялык саясаты',
  termsTitle: 'Колдонуу шарттары',
  openLegalPageLabel: 'Баракчаны ачуу',
  storeAndroid: 'Android үчүн жүктөө',
  storeIos: 'iOS үчүн жүктөө',
  contactEmail: 'Email аркылуу жазуу',
  contactTelegram: 'Telegram аркылуу жазуу',
  contactInstagram: 'Instagram',
  footer: 'Бардык укуктар корголгон.',
  privacyText:
      '1. Жалпы жоболор\nБул Купуялык саясаты KyrgyzTili Learn & Play сайты жана колдонмосунда маалыматтарды иштетүү тартибин аныктайт. Сервисти колдонуу бул саясатка макулдукту билдирет.\n\n2. Кандай маалымат чогултабыз\nТүзмөктүн техникалык маалыматын, функцияларды колдонуу боюнча статистиканы жана колдонуучу өз каалоосу менен жөнөткөн байланыш маалыматтарын иштетишибиз мүмкүн.\n\n3. Иштетүүнүн максаты\nМаалымат сервис иштеши үчүн, окутуунун сапатын жакшыртуу үчүн, туруктуулукту талдоо үчүн жана колдонуучунун кайрылууларына жооп берүү үчүн колдонулат.\n\n4. Үчүнчү тарапка берүү\nБиз жеке маалыматтарды сатпайбыз. Маалымат мыйзам чегинде жана сервис иштеши үчүн зарыл болгон өнөктөштөргө гана берилиши мүмкүн.\n\n5. Сактоо жана коргоо\nМаалыматты уруксатсыз жетүүдөн, өзгөртүүдөн же жоготуудан коргоо үчүн техникалык жана уюштуруучулук чараларды колдонобуз.\n\n6. Колдонуучунун укуктары\nКолдонуучу өз маалыматтарын тактоо, жаңылоо же өчүрүү боюнча өтүнүч бере алат. Бул үчүн сайттагы байланыштар аркылуу кайрылыңыз.\n\n7. Документтин жаңыртылышы\nСаясат мезгил-мезгили менен жаңыртылышы мүмкүн. Актуалдуу версия түз URL менен жеткиликтүү: /privacy',
  termsText:
      '1. Шарттарды кабыл алуу\nKyrgyzTili Learn & Play сервисин колдонуу менен колдонуучу ушул колдонуу шарттарына макул болот.\n\n2. Сервистин максаты\nСервис кыргыз тилин окутуу үчүн арналган. Колдонуучу сервисти мыйзамдуу жана ак ниеттүү колдонууга милдеттүү.\n\n3. Колдонуучунун жоопкерчилиги\nКолдонуучу берген маалыматтын тактыгына жана сервис колдонуудагы аракеттерине өзү жооп берет. Системаны бузууга же чектөөлөрдү айланып өтүүгө аракет кылууга тыюу салынат.\n\n4. Интеллектуалдык менчик\nСервисдеги контент, дизайн, программалык код жана башка материалдар долбоордун укук ээлерине таандык (эгер өзгөчө белгиленбесе).\n\n5. Жоопкерчиликти чектөө\nСервис "болгондой" негизде берилет. Биз ката болбойт же дайыма үзгүлтүксүз иштейт деп кепилдик бербейбиз жана кыйыр чыгымдар үчүн жоопкерчилик албайбыз.\n\n6. Өзгөртүүлөр\nБиз сервисти жана колдонуу шарттарын жаңырта алабыз. Жаңы редакция сайтта жарыяланган учурдан тартып күчүнө кирет.\n\n7. Байланыш\nЮридикалык жана уюштуруучулук суроолор боюнча: isafiulin00@gmail.com.\nТүз URL: /terms',
);

const _en = SiteContent(
  languageLabel: 'Language',
  heroTitle: 'Learn Kyrgyz in a simple and playful way',
  heroSubtitle:
      'KyrgyzTili Learn & Play helps kids and adults learn words and expressions through game-based practice, short sessions, and visible progress.',
  aboutTitle: 'About the project',
  aboutBody:
      'This educational project is focused on daily practice. The app combines vocabulary training, spaced review, and game modes.',
  linksTitle: 'Get the app',
  linksBody:
      'Official links to the mobile app versions in Google Play and App Store.',
  contactsTitle: 'Contacts',
  contactsBody: 'For partnerships, support, and feedback, contact our team.',
  privacyTitle: 'Privacy Policy',
  termsTitle: 'Terms of Use',
  openLegalPageLabel: 'Open page',
  storeAndroid: 'Download for Android',
  storeIos: 'Download for iOS',
  contactEmail: 'Email us',
  contactTelegram: 'Message in Telegram',
  contactInstagram: 'Instagram',
  footer: 'All rights reserved.',
  privacyText:
      '1. General provisions\nThis Privacy Policy describes how data is processed when using the KyrgyzTili Learn & Play website and application. By using the service, you agree to this Policy.\n\n2. Data we may collect\nWe may process device technical data, usage analytics, and contact details that users voluntarily provide through support channels.\n\n3. Purpose of processing\nData is used to provide core functionality, improve learning quality, monitor product stability, respond to user requests, and prevent abuse.\n\n4. Sharing with third parties\nWe do not sell personal data. Data may be shared only with service providers required to operate the product, and only as permitted by applicable law.\n\n5. Storage and protection\nWe apply reasonable technical and organizational safeguards to protect information from unauthorized access, alteration, loss, or disclosure.\n\n6. User rights\nUsers may request data clarification, update, or deletion where applicable by law. For requests, use the contact details on this website.\n\n7. Policy updates\nWe may update this Policy from time to time. The latest version is always available by direct URL: /privacy',
  termsText:
      '1. Acceptance of terms\nBy using the KyrgyzTili Learn & Play website and application, you agree to these Terms of Use.\n\n2. Service purpose\nThe service is intended for educational use to learn Kyrgyz language content. Users must use the service lawfully and in good faith.\n\n3. User account and behavior\nUsers are responsible for the accuracy of submitted information and for actions performed while using the service. Attempts to disrupt operations or gain unauthorized access are prohibited.\n\n4. Intellectual property\nContent, design, software code, visual materials, and other service elements are protected intellectual property of the project rights holders unless stated otherwise.\n\n5. Limitation of liability\nThe service is provided "as is". We do not guarantee uninterrupted operation or absence of errors and are not liable for indirect losses arising from service use.\n\n6. Changes to service and terms\nWe may update product functionality and revise these Terms. Updated versions take effect upon publication on the website.\n\n7. Contact\nFor legal and organizational inquiries: isafiulin00@gmail.com.\nDirect URL: /terms',
);
