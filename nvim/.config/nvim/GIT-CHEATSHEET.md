# Git in Neovim — шпаргалка

Конфиг: fugitive + gitsigns + diffview + fzf-lua + lazygit.nvim + unimpaired-дефолты.

---

## Общая схема: кто за что отвечает

| Задача | Инструмент | Вход |
|---|---|---|
| Обзор всех изменений / merge | **diffview** | `<leader>gd` |
| Знаки, hunks, inline-blame в буфере | **gitsigns** | `<leader>gh*`, `]h` |
| Коммит, push, merge-фолбэк | **fugitive** | `<leader>G*` |
| Поиск по коммитам/веткам/статусу | **fzf-lua** | `<leader>gs/gc/gb/gS` |
| Полный TUI (rebase и т.п.) | **lazygit** | `<leader>gg` |

---

## 1. Diff-ревью перед коммитом

```
<leader>gd          DiffviewOpen — файловая панель + side-by-side diff
<leader>gx          закрыть diff-панель
]h / [h             след./пред. hunk (gitsigns, в diff-окнах также ]c/[c)
<leader>ghp          показать diff hunk'а прямо в коде (inline)
<leader>ghd / ghD    diff текущего файла vs HEAD / vs ~HEAD
<leader>ghs / ghu    stage hunk / отменить stage (см. §2)
<leader>ghS / ghR    stage всё / reset весь буфер
```

**Внутри diffview-панели (дефолты плагина):**

| Клавиша | Действие |
|---|---|
| `tab` / `L` | stage / unstage файла (или hunk) |
| `ctrl-r` | reload |
| `Enter` | развернуть diff файла |
| `q` | закрыть |

## 2. Stage и коммит

```
<leader>ghs          stage hunk (n или v — выделенный)
<leader>ghu          убрать hunk из stages
<leader>ghS          stage весь буфер
<leader>ghr          reset hunk к HEAD
<leader>ghR          reset весь буфер
ih                   select hunk (в v/o — операция над hunk'ом целиком)
```

```
<leader>G            :Git — fugitive-статус (control panel)
  s / u              stage / unstage файл в статусе
  Enter              diff файла в статусе
  -                  stage/unstage в статусе (та же клавиша в diff-окне)
<leader>Gc           :Git commit — коммит (буфер, пишешь сообщение, :wq)
<leader>Gp           :Git push
<leader>gb           :Git blame — blame текущего файла
```

## 3. История и поиск

```
<leader>gf           история текущего файла (diffview)
<leader>gl           история всего репо (diffview)
<leader>ghb           blame строки под курсором (popup)
<leader>ghB           blame всего буфера
]H / [H              первый/последний hunk
```

**fzf-пикеры:**

```
<leader>gs           git status (поиск по изменённым файлам)
<leader>gc           поиск по коммитам
<leader>gb           переключение/создание веток
<leader>gS           stash
<leader>gG           LazyGit (полный TUI: log, rebase, cherry-pick)
```

История: в fzf `gc` — поиск репо-wide; чтобы открыть коммит — Enter (открывается diff); либо через `<leader>gl` (diffview).

### История файла: подробности по инструментам

**diffview** (`<leader>gf` = `:DiffviewFileHistory %`):

```
:DiffviewFileHistory %                — история текущего файла (без % — весь репо)
:DiffviewFileHistory --author=xxx %   — принимает любые опции git log, диапазоны тоже
```

- Enter — открыть дифф коммита; `<tab>` — развернуть файлы коммита
- `]q` / `[q` — следующий/предыдущий коммит
- `gf` — открыть версию файла на этот момент
- `:DiffviewClose` — закрыть всё

**fugitive** (когда diffview не нужен / нужен quickfix):

```
:Gclog --follow -p -- %       — история текущего файла в quickfix (--follow учитывает переименования)
:0Glog                        — то же без diff'ов
```

- Enter в quickfix — открыть файл на тот момент
- `:Gedit main:%` — версия файла из ветки/ревизии

**lazygit** (`<leader>gg`):

- `2` (Commits) → `<c-f>` (find file's commits) → выбрать файл → история только этого файла
- внутри: Enter — полный дифф коммита, `q` — выход


## 4. Сравнение с remote и между ветками

Сначала fetch: `:Git fetch` (или из lazygit). Дальше — любой git-rev как аргумент
diffview (`origin/main`, `@{u}`, sha, диапазоны). `@{u}` — апстрим текущей ветки.

```
:DiffviewOpen @{u}                working tree vs апстрим (вкл. незакоммиченное)
:DiffviewOpen @{u}...HEAD         мои коммиты vs апстрим — что уедет в push
:DiffviewFileHistory @{u}..HEAD   список непушенных коммитов
:DiffviewOpen main..feature       прямой diff двух веток
:DiffviewOpen main...feature      что добавила feature с момента расхождения
:DiffviewOpen <sha>^!             изменения одного коммита (как git show)
:Gdiffsplit origin/main           один файл vs rev (fugitive)
:Gitsigns diffthis origin/main    один файл vs rev (gitsigns)
```

Точки: у `DiffviewOpen` — семантика `git diff` (`..` = прямой diff, `...` = от
merge-base); у `DiffviewFileHistory` — семантика `git log` (`A..B` = коммиты B
без A). lazygit: в списке веток `M` — divergence против выбранной ветки.

## 5. Merge конфликты

### Основной путь — diffview

```
git merge branch → конфликт
<leader>gd           в merge-режиме сам показывает панель Conflicts
Enter                открыть 4-панель: OURS / THEIRS / BASE / RESULT
```

**Клавиши в merge-панели (дефолты diffview):**

| Клавиша | Действие |
|---|---|
| `]x` / `[x` | след./пред. конфликт |
| `<leader>co` | взять OURS в результат |
| `<leader>ct` | взять THEIRS |
| `<leader>cb` | взять BASE (полностью) |
| `<leader>ca` | взять всё OURS |
| `<leader>cx` | взять всё THEIRS |

Затем: `q` закрыть diffview → `<leader>Gc` → коммит.

### Фолбэк — fugitive (без diffview)

```
]h / [h              прыжки по конфликтным блокам (gitsigns)
<leader>Gd           :Gdiffsplit — diff (side-by-side) с нашей версией
:Git merge <branch>  запустить merge вручную (fugitive-команда)
:Gwrite              пометить файл resolved (из буфера файла)
:Git commit          зафиксировать merge
```

Схема вручную в конфликтом файле: правишь маркеры `<<<<<<< ======= >>>>>>>` →
сохраняешь → `:Gwrite` → следующий файл → `<leader>Gc`.

## 6. Полезное «вокруг»

```
<leader><leader>     недавние файлы
<leader>ff/fb/fg     файлы / буферы / git-файлы
]q / [q              quickfix next/prev (встроенные unimpaired-дефолты)
]b / [b              буфер next/prev (встроенные)
]t / [t              tag next/prev (встроенные)
]e / [e              переместить строку ниже/выше (unimpaired)
```

## 7. Частые сценарии — по шагам

### «Посмотрел diff, выбрал что оставить, закоммитил»

1. `<leader>gd` — полный diff всех файлов;
2. `tab` — stage нужных файлов целиком;
3. в файлах по месту: `]h` → `<leader>ghs` — stage полезных hunk'ов;
4. `q` закрыть diffview;
5. `<leader>Gc` — коммит, `<leader>Gp` — push.

### «Разрешить merge»

1. `<leader>gd` — в панели Conflicts;
2. Enter по файлу → в панели RESULT: `]x` ищем конфликт, `<leader>co`/`ct` — выбор;
3. мелкие правки сделать руками, `q` — закрыть;
4. `<leader>Gc`.

### «Кто сломал строку?»

1. `<leader>ghb` — blame под курсором;
2. `<leader>gf` — история файла в diffview → Enter по коммиту — diff;
3. `<leader>gc` — поиск по всем коммитам (fzf);
4. `<leader>gg` — LazyGit для интерактивного rebase/cherry-pick.

---

## Быстрые ссылки

- diffview справка: `:h diffview` / `:DiffviewOpen --help`
- gitsigns: `:h gitsigns`
- fugitive: `:h fugitive`
- unimpaired-дефолты Nvim core: `:h default-mappings`
