--local util = require("sourcery.util")
local colors = require("sourcery.colors")

local M = {}

---@param config Config
---@return Theme
function M.setup(config)
  config = config or require("sourcery.config")

  ---@class Theme
  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = {
    ColorColumn = {bg = c.colorcolumn_gray}, -- used for the columns set with 'colorcolumn'
    Comment = {fg = c.comment_gray, gui = c.italic_strings}, -- Comments
    -- = Conceal      {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = {bg = c.blue, fg = c.bg1}, -- character under the cursor
    -- = lCursor      {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- = CursorIM     {bg = c.red}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = {bg = c.gray}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine =   {bg = c.selection_gray}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = {fg = c.blue}, -- directory names (and other special names in listings)
    DiffAdd = {bg = c.green, fg = c.black}, -- diff mode: Added line |diff.txt|
    DiffChange = {fg = c.yellow, gui = "underline"}, -- diff mode: Changed line |diff.txt|
    DiffDelete = {bg = c.red, fg = c.bg1},
    DiffText = {bg = c.yellow, fg = c.bg1}, -- diff mode: Changed text within a changed line |diff.txt|
    -- = EndOfBuffer  {}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- = TermCursor   {}, -- cursor in a focused terminal
    -- = TermCursorNC {}, -- cursor in an unfocused terminal
    ErrorMsg = {fg = c.red}, -- error messages on the command line
    VertSplit = {fg = c.gray}, -- the column separating vertically split windows
    Folded = {fg = c.gray}, -- line used for closed folds
    FoldColumn = {}, -- 'foldcolumn'
    SignColumn = {}, -- column where |signs| are displayed
    IncSearch = {bg = c.selection_gray, fg = c.yellow}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute = {bg = c.yellow, fg = c.bg1}, -- |:substitute| replacement text highlighting
    LineNr = {fg = c.gray}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = {fg = c.purple, gui = c.bold_strings}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = {fg = c.cyan, gui = "underline"}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = {fg = c.gray}, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = {link = "ModeMsg"}, -- Area for messages and cmdline
    MsgSeparator = {link = "ModeMsg"}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg =      {fg = c.green}, -- |more-prompt|
    NonText = {fg = c.gray}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = {bg = c.bg1, fg = c.fg1}, -- normal text
    NormalFloat = {link = "Normal"}, -- Normal text in floating windows.
    NormalNC = {link = "Normal"}, -- normal text in non-current windows
    Pmenu = {bg = c.gray}, -- Popup menu: normal item.
    PmenuSel = {bg = c.green, fg = c.bg1}, -- Popup menu: selected item.
    PmenuSbar = {bg = c.gray}, -- Popup menu: scrollbar.
    PmenuThumb =   {bg = c.gray}, -- Popup menu: Thumb of the scrollbar.
    Question =     {fg = c.gray}, -- |hit-enter| prompt and yes/no questions
    -- = QuickFixLine {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search =       {bg = c.gray}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    -- = SpecialKey   {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- = SpellRare    {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = {bg = c.bg1, fg = c.fg1}, -- status line of current window
    StatusLineNC = {bg = c.bg1, fg = c.fg1}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = {bg = c.bg1}, -- tab pages line, not active tab page label
    TabLineFill =  {bg = c.bg1, fg = c.comment_gray}, -- tab pages line, where there are no labels
    -- = TabLineSel {}, -- tab pages line, active tab page label
    Title = {fg = c.green}, -- titles for output from ":set all", ":autocmd" etc.
    Visual = {bg = c.selection_gray}, -- Visual mode selection
    VisualNOS = {link = "Visual"}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = {fg = c.yellow}, -- warning messages
    Whitespace =   {fg = c.comment_gray}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = {bg = c.blue, fg = c.black}, -- current match in 'wildmenu' completion

    -- = Syntax groups
    Constant =       {fg = c.cyan}, -- (preferred) any constant
    String =         {fg = c.green}, --   a string constant: "this is a string"
    Character =      {fg = c.green}, --  a character constant: 'c', '\n'
    Number =         {fg = c.yellow}, --   a number constant: 234, 0xff
    Boolean =        {fg = c.yellow}, --  a boolean constant: TRUE, false
    Float =          {fg = c.yellow}, --    a floating point constant: 2.3e10

    Identifier =     {fg = c.purple}, -- (preferred) any variable name
    Function =       {fg = c.yellow}, -- function name (also: methods for classes)

    Statement =      {fg = c.purple}, -- (preferred) any statement
    Conditional =    {fg = c.purple}, --  if, then, else, endif, switch, etc.
    Repeat =         {fg = c.purple}, --   for, do, while, etc.
    Label =          {fg = c.red}, --    case, default, etc.
    Operator =       {fg = c.cyan}, -- "sizeof", "+", "*", etc.
    Keyword =        {fg = c.red}, --  any other keyword
    Exception =      {fg = c.purple}, --  try, catch, throw
-- = 
    PreProc =        {fg = c.yellow}, -- (preferred) generic Preprocessor
    Include =        {fg = c.purple}, --  preprocessor #include
    Define =         {fg = c.purple}, --   preprocessor #define
    Macro =          {fg = c.purple}, --    same as Define
    PreCondit =      {fg = c.yellow}, --  preprocessor #if, #else, #endif, etc.
-- = 
    Type =           {fg = c.yellow}, -- (preferred) int, long, char, etc.
    StorageClass =   {fg = c.yellow}, -- static, register, volatile, etc.
    Structure =      {fg = c.yellow}, --  struct, union, enum, etc.
    Typedef =        {fg = c.yellow}, --  A typedef
-- = 
    Special =        {fg = c.blue}, -- (preferred) any special symbol
    SpecialChar =    {fg = c.yellow}, --  special character in a constant
-- =     Tag            {}, --    you can use CTRL-] on this
    Delimiter =      {fg = c.fg1}, --  character that needs attention
    SpecialComment = {fg = c.comment_gray}, -- special things inside a comment
-- =     Debug          {}, --    debugging statements

    Underlined = {gui = c.underline_strings}, -- (preferred) text that stands out, HTML links
    Bold = {gui = c.bold_strings},
    -- = Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Italic = {gui = c.italic_strings},
    Error = {fg = c.red}, -- (preferred) any erroneous construct
    Todo = {fg = c.purple, gui = c.bold_italic_strings}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- = LSP
    LspDiagnosticsDefaultError = {fg = c.red},
    LspDiagnosticsSignError = {fg = c.red},
    LspDiagnosticsUnderlineError = {fg = c.red, gui = c.underline_strings},
    LspDiagnosticsDefaultWarning = {fg = c.yellow},
    LspDiagnosticsSignWarning = {fg = c.yellow},
    LspDiagnosticsUnderlineWarning = {fg = c.yellow, gui = c.underline_strings},
    LspDiagnosticsDefaultInformation = {fg = c.blue},
    LspDiagnosticsSignInformation = {fg = c.blue},
    LspDiagnosticsUnderlineInformation = {fg = c.blue, gui = c.underline_strings},
    LspDiagnosticsDefaultHint = {fg = c.cyan},
    LspDiagnosticsSignHint = {fg = c.cyan},
    LspDiagnosticsUnderlineHint = {gui = c.underline_strings},
    LspReferenceText = {bg = c.selection_gray}, -- used for highlighting "text" references
    LspReferenceRead = { link = "LspReferenceText"}, -- used for highlighting "read" references
    LspReferenceWrite = { link = "LspReferenceText"}, -- used for highlighting "write" references


    -- = Tree Sitter
    TSError = {fg = c.red}, -- For syntax/parser errors.
    TSPunctDelimiter =     {fg = c.fg1}, -- For delimiters ie: `.`
    TSPunctBracket =       {fg = c.red}, -- For brackets and parens.
    TSPunctSpecial =       {fg = c.fg1}, -- For special punctutation that does not fall in the catagories before.
    TSConstant =           {fg = c.yellow}, -- For constants
    TSConstBuiltin =       {fg = c.yellow}, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro =         {fg = c.yellow}, -- For constants that are defined by macros: `NULL` in C.
    TSString =             {fg = c.green}, -- For strings.
    TSStringRegex =        {fg = c.green}, -- For regexes.
    TSStringEscape =       {fg = c.cyan}, -- For escape characters within a string.
    TSCharacter =          {fg = c.green}, -- For characters.
    TSNumber =             {fg = c.yellow}, -- For integers.
    TSBoolean =            {fg = c.yellow}, -- For booleans.
    TSFloat =              {fg = c.yellow}, -- For floats.
    TSFunction =           {fg = c.blue}, -- For function (calls and definitions).
    TSFuncBuiltin =        {fg = c.blue}, -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro =          {fg = c.cyan}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSParameter =          {fg = c.yellow, gui = c.italic_strings}, -- For parameters of a function.
    TSParameterReference = {fg = c.yellow}, -- For references to parameters of a function.
    TSMethod =             {fg = c.blue}, -- For method calls and definitions.
    TSField =              {fg = c.red}, -- For fields.
    TSProperty =           {fg = c.red}, -- Same as `TSField`.
    TSConstructor =        {fg = c.cyan}, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
    TSConditional =        {fg = c.purple, gui = c.italic_strings}, -- For keywords related to conditionnals.
    TSRepeat =             {fg = c.purple, gui = c.italic_strings}, -- For keywords related to loops.
    TSLabel =              {fg = c.purple, gui = c.italic_strings}, -- For labels: `label:` in C and `:label:` in Lua.
    TSOperator =           {fg = c.cyan}, -- For any operator: `+`, but also `->` and `*` in C.
    TSKeyword =            {fg = c.purple, gui = c.bold_italic_strings}, -- For keywords that don't fall in previous categories.
    TSKeywordFunction =    {fg = c.green}, -- For keywords used to define a fuction.
    TSException =          {fg = c.green}, -- For exception related keywords.
    TSType =               {fg = c.yellow}, -- For types.
    TSTypeBuiltin =        {fg = c.red}, -- For builtin types (you guessed it, right ?).
    TSNamespace =          {fg = c.purple}, -- For identifiers referring to modules and namespaces.
    TSInclude =            {fg = c.purple, gui = c.italic_strings}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSAnnotation =         {fg = c.red}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSText =               {fg = c.fg1}, -- For strings considered text in a markup language.
    TSStrong =             {fg = c.yellow, gui = c.bold_strings}, -- For text to be represented with strong.
    TSEmphasis =           {fg = c.yellow, gui = c.italic_strings}, -- For text to be represented with emphasis.
    TSUnderline =          {fg = c.yellow, gui = c.underline_strings}, -- For text to be represented with an underline.
    TSTitle =              {fg = c.yellow}, -- Text that is part of a title.
    TSLiteral =            {fg = c.yellow}, -- Literal text.
    TSURI =                {fg = c.blue}, -- Any URI like a link or email.
    TSVariable =           {fg = c.fg1}, -- Any variable name that does not have another highlight.
    TSVariableBuiltin =    {fg = c.yellow, gui = c.italic_strings}, -- Variable names that are defined by the languages, like `this` or `self`.
    TSComment =            {fg = c.comment_gray},    -- For comment blocks.
    TSNone =               {fg = c.yellow},    -- TODO: docs
    TSSymbol =             {fg = c.red},    -- For identifiers referring to symbols or atoms.
    TSTag =                {fg = c.red, gui = c.none},    -- Tags like html tag names.
    TSTagDelimiter =       {fg = c.fg1},    -- Tag delimiter like `<` `>` `/`
    TSStrike =             {fg = c.fg1},    -- For strikethrough text.

    -- = CSS
    cssAttrComma = {fg = c.purple},
    cssAttributeSelector = {fg = c.green},
    cssBraces = {fg = c.red},
    cssClassName = {fg = c.yellow},
    cssClassNameDot = {fg = c.yellow},
    cssDefinition = {fg = c.purple, gui = c.bold_italic_strings},
    cssFontAttr = {fg = c.yellow},
    cssFontDescriptor = {link = "cssDefinition"},
    cssFunctionName = {fg = c.blue},
    cssIdentifier = {fg = c.blue},
    cssImportant = {link = "cssDefinition"},
    cssInclude = {fg = c.fg1},
    cssIncludeKeyword = {link = "cssDefinition"},
    cssMediaType = {fg = c.yellow},
    cssProp = {fg = c.fg1},
    cssPseudoClassId = {fg = c.yellow},
    cssSelectorOp = {link = "cssDefinition"},
    cssSelectorOp2 = {link = "cssDefinition"},
    cssTagName = {fg = c.red},

    -- = Git
    diffAdded = {fg = c.green},
    diffRemoved = {fg = c.red},
    diffChanged = {fg = c.yellow},
    diffFile = {fg = c.yellow},
    diffNewFile = {fg = c.yellow},
    diffLine = {fg = c.blue},
    GitGutterAdd = {link = "diffAdded"},
    GitGutterChange = {link = "diffChanged"},
    GitGutterDelete = {link = "diffRemoved"},
    GitGutterChangeDelete = {link = "diffRemoved"},

    -- = HTML
    htmlArg = {fg = c.purple, gui = c.bold_italic_strings},
    htmlBold = {fg = c.yellow, gui = c.bold_strings},
    htmlItalic = {fg = c.purple, gui = c.italic_strings},
    htmlLink = {fg = c.cyan, gui = c.underline_strings},
    htmlH1 = {fg = c.red},
    htmlH2 = {link = "htmlH1"},
    htmlH3 = {link = "htmlH1"},
    htmlH4 = {link = "htmlH1"},
    htmlH5 = {link = "htmlH1"},
    htmlH6 = {link = "htmlH1"},
    htmlSpecialChar = {fg = c.yellow},
    htmlSpecialTagName = {fg = c.red},
    htmlTag = {link = "TSTag"},
    htmlEndTag = {link = "htmlTag"},
    htmlTagN = {fg = c.red},
    htmlTagName = {fg = c.red},
    htmlTitle = {fg = c.fg1},

    -- = Javascript
    javascriptBraces = {fg = c.red},
    javaScriptFunction = {fg = c.purple},
    javaScriptIdentifier = {fg = c.purple},
    javaScriptNull = {fg = c.yellow},
    javaScriptNumber = {fg = c.yellow},
    javaScriptRequire = {fg = c.cyan},
    javaScriptReserved = {fg = c.purple},
    ---- https://github.com/pangloss/vim-javascript included in Vim-Polygot
    jsArrowFunction = {fg = c.purple, gui = c.bold_italic_strings},
    jsClassKeyword = {link = "jsArrowFunction"},
    jsClassMethodType = {link = "jsArrowFunction"},
    jsDocParam = {fg = c.blue},
    jsDocTags = {fg = c.purple},
    jsExport = {link = "jsArrowFunction"},
    jsExportDefault = {link = "jsExport"},
    jsExtendsKeyword = {link = "jsClassKeyword"},
    jsFrom = {link = "jsExport"},
    jsFuncCall = {fg = c.blue},
    jsFunction = {link = "jsArrowFunction"},
    jsGenerator = {fg = c.yellow},
    jsGlobalObjects = {link = "jsGenerator"},
    jsImport = {link = "jsExport"},
    jsModuleAs = {link = "jsExport"},
    jsModuleWords = {link = "jsExport"},
    jsModules = {link = "jsExport"},
    jsNull = {fg = c.yellow},
    jsOperator = {fg = c.purple},
    jsStorageClass = {link = "jsClassKeyword"},
    jsSuper = {fg = c.red},
    jsTemplateBraces = {fg = c.red},
    jsTemplateVar = {fg = c.green},
    jsThis = {fg = c.red},
    jsUndefined = {fg = c.yellow},

    -- JSON
    jsonCommentError = {fg = c.fg1},
    jsonKeyword = {fg = c.red},
    jsonBoolean = {fg = c.yellow},
    jsonNumber = {fg = c.yellow},
    jsonQuote = {fg = c.fg1},
    jsonMissingCommaError = {fg = c.red, gui = "reverse"},
    jsonNoQuotesError = {link = "jsonMissingCommaError"},
    jsonNumError = {link = "jsonMissingCommaError"},
    jsonString = {fg = c.green},
    jsonStringSQError = {link = "jsonMissingCommaError"},
    jsonSemicolonError = {link = "jsonMissingCommaError"},

    -- Markdown
    markdownBlockquote = {fg = c.comment_gray},
    markdownBold = {fg = c.yellow, gui = c.bold_strings},
    markdownCode = {fg = c.green},
    markdownCodeBlock = {link = "markdownCode"},
    markdownCodeDelimiter = {link = "markdownCode"},
    markdownH1 = {fg = c.red},
    markdownH2 = {link = "markdownH1"},
    markdownH3 = {link = "markdownH1"},
    markdownH4 = {link = "markdownH1"},
    markdownH5 = {link = "markdownH1"},
    markdownH6 = {link = "markdownH1"},
    markdownHeadingDelimiter = {fg = c.red},
    markdownHeadingRule = {link = "markdownBlockquote"},
    markdownId = {fg = c.purple, gui = c.bold_italic_strings},
    markdownIdDeclaration = {fg = c.blue},
    markdownIdDelimiter = {link = "markdownId"},
    markdownItalic = {fg = c.purple, gui = c.italic_strings},
    markdownLinkDelimiter = {fg = c.purple},
    markdownLinkText = {fg = c.blue},
    markdownListMarker = {fg = c.red},
    markdownOrderedListMarker = {link = "markdownListMarker"},
    markdownRule = {link = " markdownBlockquote"},
    markdownUrl = {fg = c.cyan, gui = c.underline_strings},

    -- = Python
    pythonNone = {fg = c.yellow},
    pythonBoolean = {link = "pythonNone"},
    pythonClass = {fg = c.yellow},
    pythonParens = {fg = c.red},
    pythonBuiltinObj = {fg = c.cyan, gui = c.bold_strings},
    pythonSpaceError = {bg = c.red, fg = c.fg1},
    pythonString = {fg = c.green},
    pythonDot = {fg = c.fg1},
    pythonImport = {fg = c.purple, gui = c.bold_italic_strings},
    pythonRepeat = {link = "pythonImport"},
    pythonStatement = {link = "pythonImport"},
    pythonOperator = {link = "pythonImport"},

    -- = Ruby
    rubyBlockParameter = {fg = c.red},
    rubyBlockParameterList = {link = "rubyBlockParameter"},
    rubyClass = {fg = c.purple, gui = c.bold_italic_strings},
    rubyConstant = {fg = c.yellow},
    rubyControl = {link = "rubyClass"},
    rubyEscape = {fg = c.red},
    rubyFunction = {fg = c.blue},
    rubyGlobalVariable = {fg = c.red},
    rubyInclude = {fg = c.blue},
    rubyIncluderubyGlobalVariable = {link = "rubyGlobalVariable"},
    rubyInstanceVariable = {link = "rubyGlobalVariable"},
    rubyInterpolation = {fg = c.cyan},
    rubyInterpolationDelimiter = {fg = c.red},
    rubyRegexp = {fg = c.cyan},
    rubyRegexpDelimiter = {link = "rubyRegexp"},
    rubyStringDelimiter = {fg = c.green},
    rubySymbol = {fg = c.cyan},

    -- = SASS
    sassidChar = {fg = c.red},
    sassClassChar = {fg = c.yellow},
    sassInclude = {fg = c.purple, gui = c.bold_italic_strings},
    sassMixing = {link = "sassInclude"},
    sassMixinName = {fg = c.blue},
    scssExtend = {link = "sassInclude"},
    scssImport = {link = "sassInclude"},
    scssMixin = {link = "sassMixing"},
    scssSelectorName = {fg = c.yellow},
    scssVariable = {link = "sassMixing"},

    -- = Plugins

    -- = Bufferline
    BufferCurrent = {fg = c.purple},
    -- = BufferCurrentIndex {},
    BufferCurrentMod = {fg = c.purple},
    BufferCurrentSign = {link = "BufferCurrentMod"},
    BufferCurrentIcon = {link = "BufferCurrentMod"},
    -- = BufferCurrentTarget {},
    BufferVisible = {fg = c.gray},
    -- = BufferVisibleIndex {},
    BufferVisibleMod = {fg = c.gray},
    BufferVisibleSign = {link = "BufferVisibleMod"},
    BufferVisibleIcon = {link = "BufferVisibleMod"},
    -- = BufferVisibleTarget {},
    BufferInactive = {fg = c.gray}, -- Buffer which is not active
    -- = BufferInactiveIndex {},
    BufferInactiveMod = {fg = c.gray},
    BufferInactiveSign = {fg = c.bg1}, -- The inactive sign of a buffer
    -- = BufferInactiveTarget {},
    -- = BufferTabpages {},
    BufferTabpageFill = {fg = c.bg1}, -- The sign which marks the end of the bufferline

    -- = Dashboard
    -- = dashboardHeader {},
    dashboardCenter = {fg = c.purple, gui = c.bold_strings},
    dashboardFooter = {fg = c.blue},
    --dashboardShortCut {},

    -- Indent line
    IndentLine = {fg = c.indentline_gray},
    IndentBlanklineChar = {link = "IndentLine"},
    IndentBlanklineSpaceChar = {link = "IndentLine"},
    IndentBlanklineSpaceCharBlankline = {link = "IndentLine"},
    IndentBlanklineContextChar = {link = "IndentLine"},

    -- = LSP Saga
    LspSagaDiagnosticBorder = {link = "NormalNC"},
    LspSagaDiagnosticHeader = {fg = c.purple},
    LspSagaDiagnosticTruncateLine = {link = "NormalNC"},
    LspFloatWinBorder = {link = "NormalNC"},
    LspSagaBorderTitle = {link = "Title"},
    TargetWord = {link = "Error"},
    ReferencesCount = {link = "Title"},
    ReferencesIcon = {link = "Special"},
    DefinitionCount = {link = "Title"},
    TargetFileName = {fg = c.comment_gray},
    DefinitionIcon = {link = "Special"},
    ProviderTruncateLine = {link = "NormalNC"},
    SagaShadow = {},
    LspSagaFinderSelection = {link = "Search"},
    DiagnosticTruncateLine = {link = "NormalNC"},
    DiagnosticError = {link = "LspDiagnosticsDefaultError"},
    DiagnosticWarning = {link = "LspDiagnosticsDefaultWarning"},
    DiagnosticInformation = {link = "LspDiagnosticsDefaultInformation"},
    DiagnosticWarn = {link = "LspDiagnosticsDefaultWarning"},
    DiagnosticInfo = {link = "LspDiagnosticsDefaultInformation"},
    DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
    DefinitionPreviewTitle = {link = "Title"},
    LspSagaShTruncateLine = {link = "NormalNC"},
    LspSagaDocTruncateLine = {link = "NormalNC"},
    LineDiagTuncateLine = {link = "NormalNC"},
    LspSagaCodeActionTitle = {link = "Title"},
    LspSagaCodeActionTruncateLine = {link = "NormalNC"},
    LspSagaCodeActionContent = {link = "Normal"},
    LspSagaRenamePromptPrefix = {fg = c.purple},
    LspSagaRenameBorder = {gui = c.bold_strings},
    LspSagaHoverBorder = {gui = c.bold_strings},
    LspSagaSignatureHelpBorder = {gui = c.bold_strings},
    LspSagaCodeActionBorder = {gui = c.bold_strings},
    LspSagaAutoPreview = {},
    LspSagaDefPreviewBorder = {gui = c.bold_strings},
    LspLinesDiagBorder = {gui = c.bold_strings},

    --nvim-compe
    CompeDocumentation = {fg = c.fg1, bg = c.colorcolumn_gray},

    -- =nvim-dap
    DebugBreakpoint = {fg = c.red},
    DebugBreakpointLine = {fg = c.red, gui = c.underline_strings},
    DebugHighlight = {fg = c.blue},
    DebugHighlightLine = {fg = c.purple, gui = c.italic_strings},
    NvimDapVirtualText = {fg = c.cyan, gui = c.italic_underline_strings},

    -- =nvim-tree
    NvimTreeRootFolder = {fg = c.purple, gui = c.bold_strings},
    NvimTreeFolderName = {fg = c.blue},
    NvimTreeIndentMarker = {fg = c.gray},
    NvimTreeSymlink = {fg = c.cyan, gui = c.underline_strings},
    NvimTreeFolderIcon = {fg = c.purple},
    NvimTreeEmptyFolderName = {fg = c.comment_gray},
    NvimTreeExecFile = {fg = c.green, gui = c.bold_underline_strings},
    NvimTreeSpecialFile = {link = "Special"},
    NvimTreeImageFile = {},
    NvimTreeMarkdownFile = {fg = c.red},

    NvimTreeLicenseIcon = {fg = c.yellow},
    NvimTreeYamlIcon = {fg = c.yellow},
    NvimTreeTomlIcon = {fg = c.yellow},
    NvimTreeGitignoreIcon = {fg = c.red},
    NvimTreeJsonIcon = {fg = c.green},
    
    NvimTreeLuaIcon = {fg = c.blue},
    NvimTreePythonIcon = {fg = c.yellow},
    NvimTreeShellIcon = {fg = c.fg1},
    NvimTreeCIcon = {fg = c.blue},
    NvimTreeReactIcon = {fg = c.blue},
    NvimTreeHtmlIcon = {fg = c.red},
    NvimTreeRustIcon = {fg = c.fg1},
    NvimTreeTypescriptIcon = {fg = c.blue},
    NvimTreeVimIcon = {fg = c.green},
    NvimTreeJavascriptIcon = {fg = c.yellow},

    NvimTreeGitDirty = {fg = c.red},
    NvimTreeGitStaged = {fg = c.yellow},
    NvimTreeGitMerge = {fg = c.cyan},
    NvimTreeGitRenamed = {fg = c.yellow},
    NvimTreeGitNew = {fg = c.purple},
    
    -- = Startify
    StartifyBracket = {fg = c.fg1},
    StartifyFile = {fg = c.purple, gui = c.bold_strings},
    StartifyFooter = {fg = c.fg1},
    StartifyHeader = {fg = c.green},
    StartifyNumber = {fg = c.yellow},
    StartifyPath = {fg = c.gray},
    StartifySection = {fg = c.blue, gui = c.bold_italic_strings},
    StartifySelect = {fg = c.cyan},
    StartifySlash = {fg = c.gray},
    StartifySpecial = {fg = c.red},

    -- = Telescope
    TelescopeSelection = {fg = c.purple},
    TelescopeSelectionCaret = {fg = c.purple},
    TelescopeMultiSelection = {fg = c.comment_gray},
    TelescopeNormal = {fg = c.fg1},
    TelescopeBorder = {fg = c.comment_gray},
    TelescopePromptBorder = {link = "TelescopeBorder"},
    TelescopePreviewBorder = {link = "TelescopeBorder"},
    TelescopeMatching = {fg = c.green, gui = c.underline_strings},
    TelescopePromptPrefix = {fg = c.purple},
    TelescopePrompt = {link = "TelescopeNormal"},

    -- Ultest
    UltestPass = {fg = c.green},
    UltestFail = {fg = c.red},
    UltestRunning = {fg = c.yellow},
    UltestBorder = {fg = c.comment_gray},
    UltestInfo = {fg = c.purple, gui = c.bold_strings},
   }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.base["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

  theme.defer = {}
  theme.plugins = {}

  return theme
end

return M
