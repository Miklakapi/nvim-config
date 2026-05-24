; extends

(call_expression
  function: (identifier) @_tag
  arguments: (template_string
    (string_fragment) @injection.content)
  (#eq? @_tag "html")
  (#set! injection.language "html"))

(call_expression
  function: (identifier) @_tag
  arguments: (template_string
    (string_fragment) @injection.content)
  (#eq? @_tag "css")
  (#set! injection.language "css"))

(call_expression
  function: (member_expression
    property: (property_identifier) @_method)
  arguments: (arguments
    (template_string
      (string_fragment) @injection.content))
  (#eq? @_method "replaceSync")
  (#set! injection.language "css"))
