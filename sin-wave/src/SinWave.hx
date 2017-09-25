import haxe.Timer;

using NumberTools;

class SinWave {

    public function new() {
        trace('Sin Wave');

        var n = 0;
        var volume = 0.3;
        var frequency = 425;

        // Create a sin wave audio source
        var audio = AudioPlayer
            .create()
            .useGenerator((out, sampleRate) -> for( i in 0...out.length >> 1 ) {
                var sin = MathUtils.sin(2 * MathUtils.PI * n * frequency / sampleRate) * volume;
                out.set(i*2, sin); // Left
                out.set(i*2 + 1, sin); // Right
                n++;
            })
            .play();

        // Stop it after 3 seconds
        Timer.delay(() -> audio.stop(), DateTools.seconds(3).int());
    }

    // Main entry point
    static public function main() {
        new SinWave();
    }
}