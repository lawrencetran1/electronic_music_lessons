(function(){
  angular
    .module('emlApp')
    .controller('PianoController', PianoController);

    PianoController.$inject = ['$resource','$state'];

  function PianoController($resource,$state){
    var self = this;
  

    var width = 900,  
    height = 440,
    outerRadius = (height - 60),
    innerRadius = outerRadius / 2.4;

    var over = "ontouchstart" in window ? "touchstart" : "mouseover",
        out = "ontouchstart" in window ? "touchend" : "mouseout";

    var pie = d3.layout.pie()
        .startAngle(-Math.PI / 2)
        .endAngle(Math.PI / 2)
        .padAngle(.01)
        .value(function() { return 1; })
        .sort(null);

    var arc = d3.svg.arc()
        .cornerRadius(4)
        .padRadius(outerRadius)
        .innerRadius(function(d) { return d.sharp ? innerRadius + 80 : innerRadius; });

    var svg = d3.select("body").append("svg")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + (height - 40) + ")");

    var key = svg.selectAll("path")
        .data(sharpen(pie(repeat(["C", "D", "E", "F", "G", "A", "B"]))))
      .enter().append("path")
        .each(function(d, i) { d.outerRadius = outerRadius - 20; })
        .attr("class", function(d) { return "key key--" + (d.sharp ? "black" : "white"); })
        .attr("d", arc)
        .on(over, arcTween(outerRadius, 0))
        .on(out, arcTween(outerRadius - 20, 150));

    function arcTween(outerRadius, delay) {
      return function() {
        d3.event.preventDefault();
        d3.select(this).transition().delay(delay).attrTween("d", function(d) {
          var i = d3.interpolate(d.outerRadius, outerRadius);
          return function(t) { d.outerRadius = i(t); return arc(d); };
        });
      };
    }

    function repeat(notes) {
      return notes.concat(notes, notes[0]);
    }

    function sharpen(keys) {
      var keyWidth = (pie.endAngle() - pie.startAngle()) / keys.length;

      for (var i = 0, n = keys.length - 1, k; i < n; ++i) {
        if (/[CDFGA]/.test((k = keys[i]).data)) {
          keys.splice(++i, 0, {
            startAngle: k.startAngle + keyWidth * .65,
            endAngle: k.endAngle + keyWidth * .35,
            padAngle: k.padAngle,
            sharp: true
          });
          ++n;
        }
        k.sharp = false;
      }

      for (var i = 0, n = keys.length; i < n; ++i) {
        keys[i].frequency = 440 * Math.pow(2, (i - 9) / 12); // 0 is middle C
      }

      return keys.sort(function(a, b) { return a.sharp - b.sharp; });
    }

    (function() {
      var AudioContext = window.AudioContext || window.webkitAudioContext || window.mozAudioContext || window.oAudioContext;
      if (!AudioContext) return console.error("AudioContext not supported");
      if (!OscillatorNode.prototype.start) OscillatorNode.prototype.start = OscillatorNode.prototype.noteOn;
      if (!OscillatorNode.prototype.stop) OscillatorNode.prototype.stop = OscillatorNode.prototype.noteOff;

      var context = new AudioContext;

      key.on(over + ".beep", function(d, i) {
        var now = context.currentTime,
            oscillator = context.createOscillator(),
            gain = context.createGain();
        oscillator.type = "sine";
        oscillator.frequency.value = d.frequency;
        gain.gain.linearRampToValueAtTime(0, now);
        gain.gain.linearRampToValueAtTime(.4, now + .1);
        gain.gain.linearRampToValueAtTime(0, now + 1);
        oscillator.connect(gain);
        gain.connect(context.destination);
        oscillator.start(0);
        setTimeout(function() { oscillator.stop(); }, 1500);
      });
    })();

  };


})();