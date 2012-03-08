app = exports ? this
class @Console

  # doc: -> app.iframe_manager.doc
  # body: -> $('body', app.iframe_manager.doc)
  config:
    promptLabel: '> '
    commandValidate: (line) ->
      if (line == "")
        false
      else
        true

    commandHandle: (line, report) ->
      $.getJSON '/eval', line: line, (data) ->
        console.log(data)
        # report('Valid?' + data['valid'])
        if( data['valid'] )
          report( $(data['truth_table']) )
        else
          report('Invalid formula.')

    charInsertTrigger: (key, line) ->
      # console.log(String.fromCharCode(key))
      app.konsole.fixText(line+String.fromCharCode(key))
      false

    animateScroll: true
    promptHistory: true
    welcomeMessage: 'Enter some TryLogic expressions to evaluate.'

  promptText: (text) ->
    @controller.promptText(text)

  fixText: (text) ->
    replaces = [
      ['<->', '↔'],
      ['->', '→'],
      ['and', '∧'],
      ['&', '∧'],
      ['^', '∧'],
      ['or', '∨'],
      ['not', '¬'],
      ['!', '¬'],
      ['~', '¬'],
      ['T', '⊤'],
      ['F', '⊥'],
      [/[a-o]/, ''],
      [/[q-z]/, '']
    ]

    $(replaces).each (_,rep) ->
      # console.log(from, to)
      text = text.replace(rep[0], rep[1])
    @controller.promptText(text)
    # fixed_text != text

  constructor: ->
    k = $('.console')
    @controller = k.console(@config);
    @controller.promptText('(p0→p1)');
    k.height( $(document).height()-20 )