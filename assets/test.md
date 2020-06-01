# Flutter Markdown

[![pub package](https://img.shields.io/pub/v/flutter_markdown.svg)](https://pub.dartlang.org/packages/flutter_markdown)
[![Build Status](https://travis-ci.org/flutter/flutter_markdown.svg?branch=master)](https://travis-ci.org/flutter/flutter_markdown)

A markdown renderer for Flutter. It supports the
[original format](https://daringfireball.net/projects/markdown/), but no inline
html.

## Getting Started

Using the Markdown widget is simple, just pass in the source markdown as a
string:

    new Markdown(data: markdownSource);

If you do not want the padding or scrolling behavior, use the MarkdownBody
instead:

    new MarkdownBody(data: markdownSource);

By default, Markdown uses the formatting from the current material design theme,
but it's possible to create your own custom styling. Use the MarkdownStyle class
to pass in your own style. If you don't want to use Markdown outside of material
design, use the MarkdownRaw class.

## Image support

The `Img` tag only supports the following image locations:

- From the network: Use a URL prefixed by either `http://` or `https://`.

- From local files on the device: Use an absolute path to the file, for example by
  concatenating the file name with the path returned by a known storage location,
  such as those provided by the [`path_provider`](https://pub.dartlang.org/packages/path_provider)
  plugin.

- From image locations referring to bundled assets: Use an asset name prefixed by `resource:`.
  like `resource:assets/image.png`.

|       | **Wh Questions** |
|-------| ---  |
| where | **do** I **play** ? |
| what | **do** you **play** ? |
| why | **do**es he **play** ? |
| who | **do**es she **play** ? |
| when | **do** we **play ?** |
| how | **do** they **play** ? |

## Numerated list

1. Item 1
1. Item 2

> Some text between list items

3. Item 3
   1. Item 3.1
   1. Item 3.2
3. Item 4

## Blockquotes

As Kanye West said:

> We're living the future so
> the present is our past.
