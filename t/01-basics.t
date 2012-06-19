# beda html block dan markdown paragraph biasa: <p> gak ditambahin,

# header, style 1

for ("=", "===", "======") {
    is(md2h("header\n$_\n"), "<h1>header</h1>\n");
}

is(md2h("header\015\012=\n"), "<h1>header</h1>\n", "newline \\015\\012");

for ("-", "---", "------") {
    is(md2h("header\n$_\n"), "<h2>header</h2>\n");
}

is(md2h("non-header\n ===\n"), "<p>non-header\n ===</p>\n");

# header, style 2

for ("", " #", " ##", " #######") {
    is(md2h("# header$_\n"), "<h1>header</h1>\n");
    is(md2h("## header$_\n"), "<h2>header</h2>\n");
    is(md2h("### header$_\n"), "<h3>header</h3>\n");
    is(md2h("#### header$_\n"), "<h4>header</h4>\n");
    is(md2h("##### header$_\n"), "<h5>header</h5>\n");
    is(md2h("###### header$_\n"), "<h6>header</h6>\n");
}

is(md2h("####### header 7 ###\n"), "<h6># header 7</h6>\n");
is(md2h("### header w/ suffix ## ####\n"), "<h6>header w/ suffix ##</h6>\n");

is(md2h(" # non-header\n"), "<p> # non-header</p>\n");
