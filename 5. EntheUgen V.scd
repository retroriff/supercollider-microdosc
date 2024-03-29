/**
     _____/\/\/\______/\/\/\/\________/\/\/\___
    ___/\/\/\/\____/\/\____/\/\____/\/\/\/\___
   _/\/\__/\/\____/\/\__/\/\/\__/\/\__/\/\___
  _/\/\/\/\/\/\__/\/\/\__/\/\__/\/\/\/\/\/\_
 _______/\/\______/\/\/\/\__________/\/\___
__________________________________________

*/

(
~blip1 = {
    var sig1 = Saw.ar(
        freq: [MouseX.kr(200, 400), MouseX.kr(200, 400) * 1.05]
    );
    var sig2 = LFPulse.kr(
        freq: SinOscFB.kr(~tempo.kr / 8).range(4, 16),
        width: SinOscFB.kr(~tempo.kr / 8).range(0.2, 1),
    );
    sig1 * sig2 * 0.2;
}
)

(
~blip2 = {
    var sig1 = LFPulse.kr(
        freq: ~tempo.kr * 8,
        iphase: 0,
        width: 0.2,
        mul: SinOscFB.kr(~tempo.kr / 16).range(0.1, 1)
    );
    var sig2 = SinOsc.ar(300);
    sig1 * sig2;
}
)

(
~blip3 = {
    var sig1 = LFPulse.kr(
        freq: ~tempo.kr * 8,
        iphase: 1,
        width: 0.2,
        mul: SinOscFB.kr(~tempo.kr / 16).range(0.1, 0.2)
    );
    var sig2 = SinOsc.ar(freq: [600, 605], mul: 0.2);
    sig1 * sig2;
}
)

(
~blip4 = {
    LFPulse.ar(
        freq: SinOscFB.kr(freq: ~tempo.kr * 4, feedback: 1).range(300, 600),
        iphase: 0,
        width: SinOscFB.kr(~tempo.kr).range(0, 1),
        mul: SinOsc.kr(~tempo.kr / 4).range(0.2, 1) * 0.1
    );
}
)
