# text must end with newline!

my $block_elems_re = # top level elements
    qr/
          (?<hs1> # header, style 1
              (?<hs1_text>[^\r\n]*\S[^\r\n]*)\R
              [=-]+[ \t]*\R) |

          (?<hs2> # header, style 2
              (?<hs2_prefix\#{1,6})\s*(?<hs2_text>[^\r\n]*\S[^\r\n]*?) \#*\R) |

          (?<code>
              (?: \t|[ ]{4} [^\r\n]+ \R )+) |

          (?<line>
              [ ]{0,3}
              (?:-{3}[ -]* | _{3}[ _]* | \*{3}[ *]*) \R) |
          ) |

          (?<html>
          ) |

          (?<normal>
          )
          /msxi;

# html comment
# block quote
# list

# span:
# - links: [foo](http://url "Title")
# - ref: [foo][id]
# - ref definition: [id]: http://example.com/ 'Title'
#                   [id]: http://example.com/ "Title"
#                   [id]: http://example.com/ (Title)
# - implicit link (id = namanya sendiri): [id][]
# - *em*, _em_, **strong**, __strong__
# - `code`, ``literal backtick``
# - images: ![Alt text](/path/to/image)
# - automatic link: <http://foo>
# - backspace (escape) for \ ` * _ {} [] () # + - . !
#
# ref: http://daringfireball.net/projects/markdown/syntax

# handle escaping

# ABSTRACT: Parse Markdown with as little code as possible

=head1 SYNOPSIS

 package MyParser;
 use parent qw(Markdown::Parser::Tiny);

 sub start_unordered_list { ... }
 sub start_list_item { ... }
 ...


=head1 DESCRIPTION

This module is meant as an alternative Markdown parser which can parse standard
Markdown document with little startup overhead.

To use this module, subclass it and provide implementation for the following
handlers. Each handler might be passed extra information in hash form.

=over 4

=item * start_unordered_list

=item * end_unordered_list

=item * start_ordered_list

=item * end_ordered_list

=item * got_list_item

=item * got_header

=item * got_line

=item * got_code

=item * got_html_block

=item * got_html_comment

=item * start_emphasis

=item * end_emphasis

=item * start_strong

=item * end_strong

=back

For example usage, see L<Markdown::To::HTML::Tiny> and
L<Markdown::To::POD::Tiny>.


=head1 SEE ALSO

Specification: http://daringfireball.net/projects/markdown/syntax

Modules which uses this parser (come with this distribution):
L<Markdown::To::HTML::Tiny>, L<Markdown::To::POD::Tiny>.

L<Markdent>

L<Text::Markdown>
