/**
_________/\\\________/\\\\\_________________________________
 ________\/\\\______/\\\///\\\_______________________________
  ________\/\\\____/\\\/__\///\\\_____________________________
   ________\/\\\___/\\\______\//\\\__/\\\\\\\\\\_____/\\\\\\\\_
    ___/\\\\\\\\\__\/\\\_______\/\\\_\/\\\//////____/\\\//////__
     __/\\\////\\\__\//\\\______/\\\__\/\\\\\\\\\\__/\\\_________
      _\/\\\__\/\\\___\///\\\__/\\\____\////////\\\_\//\\\________
       _\//\\\\\\\/\\____\///\\\\\/______/\\\\\\\\\\__\///\\\\\\\\_
        __\///////\//_______\/////_______\//////////_____\////////__

June, 2021

*/

~m41 = Ndef(\m41).play;

(
~m41[0] = {
    Gbman2DL.ar(
        minfreq: [400, 390],
        maxfreq: 400,
        x0: LFPulse.kr(t / 8).range(0.5, 3),
        y0: LFPulse.kr(t / 8).range(0, 4),
        mul: LFSaw.kr(t * 8).range(0.5, 1)
    )
}
)

~m42 = Ndef(\m42).play;

(
~m42[0] = {
    var sig1 = Gbman2DN.ar(
        minfreq: 600 ! 2 * SinOscFB.kr(t * 8, feedback: 0.5).range(0.8, 3),
        maxfreq: 150 * SinOsc.kr(t / 2).range(0.8, 1.2),
        x0: 1.2,
        y0: 2.5,
        mul: LFSaw.kr(t / 4).range(0, 0.3)
    );
    var sig2 = LFSaw.ar(t / 4).range(0, 1.5);
    sig1 * sig2;
}
)

~m43 = Ndef(\m43).play;

(
~m43[0] = {
    Gbman2DN.ar(
        minfreq: 800 * LFPulse.kr(t / 8).range(2, 2),
        maxfreq: 200,
        x0: 1.2,
        y0: 2,
        mul: LFSaw.kr(t).range(0, 0.8)
    ) ! 2;
}
)

