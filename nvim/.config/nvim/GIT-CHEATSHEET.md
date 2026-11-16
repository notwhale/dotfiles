# Git in Neovim — шпаргалка

Конфиг: diffview + gitsigns + fugitive + fzf-lua + lazygit.

| Задача | Инструмент | Вход |
|---|---|---|
| Обзор изменений / merge | **diffview** | `<leader>gd` |
| Hunks, знаки, blame | **gitsigns** | `<leader>gh*`, `]h` |
| Коммит, push, фолбэки | **fugitive** | `<leader>G*` |
| Поиск: коммиты/ветки/… | **fzf-lua** | `<leader>gs/gc/gb/gS` |
| Полный TUI (rebase и т.п.) | **lazygit** | `<leader>gg` |

## 1. Diff-ревью перед коммитом

```
<leader>gd                DiffviewOpen — панель файлов + side-by-side
<leader>gx                закрыть
]h / [h                   hunk след./пред. (в diff-окнах сами работают как ]c/[c)
]H / [H                   последний / первый hunk
<leader>ghp               показать hunk инлайн
<leader>ghs / ghu / ghr   stage / unstage / reset hunk
<leader>ghS / ghR         stage весь буфер / reset буфер
<leader>ghd / ghD         diff файла vs index / vs ~HEAD
ih                        hunk как text-object (v/o/x)
```

Панель diffview: `tab`/`L` — stage/unstage, `Enter` — дифф файла, `<c-r>` — reload, `q` — закрыть.

## 2. Stage и коммит

```
<leader>G                :Git — статус: s/u — stage/unstage, Enter — diff, - — stage hunk
<leader>Gc / Gp / Gb     commit / push / blame
```

## 3. История

```
<leader>gf / gl          история файла / репо (diffview)
<leader>ghb / ghB        blame строки / буфера
<leader>gc / gs / gS / gb  fzf: коммиты / status / stash / ветки
```

- `:DiffviewFileHistory %` принимает опции git log (`--author=…`, диапазоны); Enter — дифф коммита, `]q`/`[q` — след./пред., `gf` — файл на тот момент.
- fugitive: `:Gclog --follow -p -- %` — история файла в quickfix; `:Gedit main:%` — версия файла из ветки/rev.
- lazygit: `2` (Commits) → `<c-f>` — коммиты этого файла; Enter — дифф.

## 4. Сравнение веток / rev

Сначала fetch (`:Git fetch` / lazygit). `@{u}` — апстрим текущей ветки.

```
:DiffviewOpen @{u}                worktree vs апстрим (вкл. незакоммиченное)
:DiffviewOpen @{u}...HEAD         что уедет в push
:DiffviewOpen main..feature       прямой diff веток
:DiffviewOpen main...feature      от merge-base
:DiffviewOpen <sha>^!             один коммит (как git show)
:DiffviewFileHistory @{u}..HEAD   непушенные коммиты
```

Семантика: `DiffviewOpen` = `git diff` (`..` прямой, `...` merge-base); `DiffviewFileHistory` = `git log`.

**Без diffview** (фолбэк, если упал):

```
:Git diff master            весь дифф пейджером: фолды по файлам, - на hunk — stage/unstage
:Gdiffsplit master          один файл vs rev (fugitive; <leader>Gd — vs index)
:Gitsigns diffthis master   один файл vs rev
:Gedit master:%             версия файла в буфер
```

lazygit: список веток → `M` — divergence, Enter — дифф.

**Нативный diff-режим** (движок у всех выше один):

```
:windo diffthis / :diffoff / :diffupdate   вкл / выкл / пересчитать
]c / [c                    блок след./пред.
do / dp                    забрать hunk из другого окна / отдать свой
:1,10diffget               применить к диапазону строк
```

## 5. Merge конфликты

Основной путь — diffview: `<leader>gd` → панель Conflicts → `Enter` — 4-панель OURS/BASE/THEIRS/RESULT.

```
]x / [x                  конфликт след./пред.
<leader>co / ct / cb     взять OURS / THEIRS / BASE
<leader>ca / cx          взять всё OURS / всё THEIRS
```

`q` → `<leader>Gc`.

Фолбэк — fugitive: `:Gdiffsplit!` — three-way с OURS/THEIRS; забор сторон `:diffget //2` (ours) / `:diffget //3` (theirs), навигация `]c`/`[c`. Затем `:Gwrite` (resolved) → `:Git commit`. Совсем вручную: править маркеры → `:Gwrite`.

## 6. Вокруг

```
<leader><leader>         недавние файлы
<leader>ff / fb / fg     файлы / буферы / git-файлы
]q/[q  ]b/[b  ]t/[t      quickfix / буфер / tag (встроенные)
```

## 7. Сценарии

- **Ревью → коммит**: `<leader>gd` → `tab` файлы, `]h`+`<leader>ghs` hunk'и → `q` → `<leader>Gc` → `Gp`.
- **Merge**: `<leader>gd` → `Enter` → `]x` + `<leader>co/ct` → `q` → `<leader>Gc`.
- **Кто сломал строку**: `<leader>ghb` → `<leader>gf` / `<leader>gc` → `<leader>gg`.

---

`:h diffview` · `:h gitsigns` · `:h fugitive` · `:h default-mappings`
