# Git cheatsheet

## История конкретного файла

### diffview.nvim

```
:DiffviewFileHistory %        — история текущего файла (без % — всего репо)
:DiffviewFileHistory --author=xxx %   — git-log опции работают
```

- `j/k`, Enter — открыть дифф коммита; `<tab>` — развернуть файлы коммита
- `]q` / `[q` — следующий/предыдущий коммит
- `gf` — открыть версию файла на этот момент
- `:DiffviewClose` — закрыть всё

### fugitive

```
:Gclog --follow -p -- %       — история текущего файла в quickfix (с переименованиями)
:0Glog                        — то же без diff'ов
```

- Enter в quickfix — открыть файл на тот момент
- `:Gedit main:%` — версия файла из ветки/ревизии

### lazygit

- `2` → Commits → **`<c-f>`** (find file's commits) → выбрать файл
- внутри: `Enter` — полный дифф коммита, `q` — выход
