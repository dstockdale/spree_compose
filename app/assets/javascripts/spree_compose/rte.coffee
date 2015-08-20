$ ->

  # If spree_summernote is installed make sure the translations get the summernote applied to the body

  if Spree.SpreeSummernote?

    $("#attr_fields textarea[id$='_body']").summernote
      lang: Spree.SpreeSummernote.translatedLocale()
      tabsize: 2
      minHeight: 300
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['picture','video','link']]
      ]