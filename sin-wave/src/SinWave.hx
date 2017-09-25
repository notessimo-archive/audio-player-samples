class SinWave {

    public function new() {
        trace('Sin Wave');

        var n = 0;
        var volume = 0.3;
        var frequency = 425;

        AudioPlayer
            .create()
            .useGenerator((out, sampleRate) -> for (i in 0...out.length >> 1) {
                var sin = MathUtils.sin( 2 * MathUtils.PI * n * frequency / sampleRate ) * volume;
                out.set(i*2, sin);
                out.set(i*2 + 1, sin);
                n++;
            });
    }

    static public function main() {
        new SinWave();
    }
}