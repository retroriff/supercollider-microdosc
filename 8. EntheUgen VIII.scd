/**
_____________________________________________________________________________/\\\________/\\\\\_________________________________
 ____________________________________________________________________________\/\\\______/\\\///\\\_______________________________
  ______________________/\\\__________________________________________________\/\\\____/\\\/__\///\\\_____________________________
   ____/\\\\\__/\\\\\___\///______/\\\\\\\\__/\\/\\\\\\\______/\\\\\___________\/\\\___/\\\______\//\\\__/\\\\\\\\\\_____/\\\\\\\\_
    __/\\\///\\\\\///\\\__/\\\___/\\\//////__\/\\\/////\\\___/\\\///\\\____/\\\\\\\\\__\/\\\_______\/\\\_\/\\\//////____/\\\//////__
     _\/\\\_\//\\\__\/\\\_\/\\\__/\\\_________\/\\\___\///___/\\\__\//\\\__/\\\////\\\__\//\\\______/\\\__\/\\\\\\\\\\__/\\\_________
      _\/\\\__\/\\\__\/\\\_\/\\\_\//\\\________\/\\\_________\//\\\__/\\\__\/\\\__\/\\\___\///\\\__/\\\____\////////\\\_\//\\\________
       _\/\\\__\/\\\__\/\\\_\/\\\__\///\\\\\\\\_\/\\\__________\///\\\\\/___\//\\\\\\\/\\____\///\\\\\/______/\\\\\\\\\\__\///\\\\\\\\_
        _\///___\///___\///__\///_____\////////__\///_____________\/////______\///////\//_______\/////_______\//////////_____\////////__

* @date: May, 2021
*/

(
// Start Proxy
p = ProxySpace(s).push;
p[\tempo] = 110 / 60;
p.quant = 4;
p.fadeTime = 20;
StageLimiter.new(2);
)

(
// Panes
s.plotTree;
s.scope(2);
s.makeWindow;
m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);
PdefAllGui.new;
)

(
// Controllers
~muscimol.release(20);
~reverb.play;
~blowPass.play;
~hpf.play;
~lpf.play;
~delay.play;
~reverb.release(20);
~blowPass.release(20);
~delay.release(20);
)


(
~muscimol = {
    SinOscFB.ar(
        freq: [100, 101],
        feedback: LFSaw.kr(~tempo.kr / 4).range(0.1, 1),
        mul: LFPulse.kr(~tempo.kr / 2).range(0.2, 1)
    );
}
)


(
~hihat = {
    var lfo1, lfo2;
    lfo1 = Trig.ar(in: LFPulse.ar(~tempo.kr * 4), dur: 0.01).lag;
    lfo2 = LFPulse.kr(~tempo.kr / 2).range(1, 0.8);

    HPF.ar(
        in: WhiteNoise.ar(1) !2,
        freq: 4000,
        mul: lfo1 * 0.5
    ) * 0.15;
}
)

(
~reverb = {
    GVerb.ar(
        in: ~ei3.ar,
        roomsize: LFPulse.ar(~tempo.kr / 4).range(1, 10),
        revtime: 3,
        damping: 0.5,
        inputbw: 0.5,
        spread: 15,
        drylevel: 1,
        mul: 0.5
    );
}
)

(
~blowPass = {
    BLowPass4.ar(
        in: ~ei3.ar,
        freq: SinOsc.kr(~tempo.kr / 8).range(700, 20000),
        rq: 0.1
    );
}
)

(
~hpf = {
    RHPF.ar(
        in: ~ei3.ar,
        freq: SinOsc.kr(~tempo.kr / 8).range(1000, 3000),
        rq: 0.1,
        mul: LFPulse.kr(~tempo.kr).range(0.1, 1)
    );
}
)

(
~lpf = {
    RLPF.ar(
        in: ~ei3.ar,
        freq: LFSaw.kr(~tempo.kr / 8).range(200, 700),
        rq: 0.1,
        mul: LFPulse.kr(~tempo.kr).range(0, 1)
    );
}
)

(
~delay = {
    var lfo;
    lfo = SinOsc.kr(0.1).exprange(0.05, 0.5);

    CombC.ar(
        in: ~ei3.ar,
        maxdelaytime: ~tempo.kr * 4,
        delaytime: lfo,
        mul: ~tempo.kr
    );
}
)