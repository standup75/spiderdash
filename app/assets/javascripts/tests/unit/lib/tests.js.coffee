window.touch = false

window.getColorAt = (x, y, ctx) ->
  hex = (dec) ->
    ("0"+parseInt(dec, 16)).substr -2 
  imgd = ctx.getImageData x, y, 1, 1
  data = imgd.data
  color: "#"+hex(data[0])+hex(data[1])+hex(data[2])
  alpha: hex data[3]

pubsub.subscribe "init_done_done", ->
  pubsub.publish("pause") if $("#unit-tests ul").length>0
  
  # unit tests
  $("#unit-tests ul").append("<li><input type='checkbox' name='#{test}'/>#{test.replace(/_/, " ")}</li>") for test of swTests
  $("#select-all-units input").click -> $("#unit-tests [type=checkbox]").prop("checked", this.checked)
  $("#execute-unit-tests").click ->
    $tests = $("#unit-tests [type=checkbox]:checked")
    $("#perf-test-content").hide()
    $("#qunit-tests").empty()
    $("#unit-test-content").fadeIn() if $tests.length>0
    QUnit.load()
    $tests.each ->
      swGame.level.gotoLastLevel true
      pubsub.publish "killSprites"
      swTests[this.name]()
  
  # performance tests
  $("#perf-tests ul").append("<li><input type='checkbox' name='perf-#{i}'/>#{test.name}</li>") for test, i in swPerfs
  $("#select-all-perfs input").click -> $("#perf-tests [type=checkbox]").prop("checked", this.checked)
  $("#execute-perf-tests").click ->
    $tests = $("#perf-tests [type=checkbox]:checked")
    $("#unit-test-content").hide()
    $ul = $("#perf-test-content").empty()
    $ul.fadeIn() if $tests.length>0
    $ul.on "click", "li", ->
      $(this).toggleClass "show-details"
    testNumber = 0
    iterationCount = 200
    $tests.each ->
      perf = swPerfs[this.name.split("-")[1]]
      testNumber++
      swGame.level.gotoLastLevel true
      pubsub.publish "killSprites"
      name = "Performance test ##{testNumber}"+(if perf.name then ": #{perf.name}" else "")
      classname=""
      perf.setup?()
      console.profile name
      perf.test() for n in [1..iterationCount]
      console.profileEnd()
      perf.teardown?()
      info = perf.test.toString()
      $ul.append "<li class='"+classname+"'>#{name}<code><pre>#{info}</pre></code></li>"
