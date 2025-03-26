# Orpheus-TTS-Local

A lightweight client for running [Orpheus TTS](https://huggingface.co/canopylabs/orpheus-3b-0.1-ft) locally using LM Studio API.

## Features

- 🎧 High-quality Text-to-Speech using the Orpheus TTS model
- 💻 Completely local - no cloud API keys needed
- 🔊 Multiple voice options (tara, leah, jess, leo, dan, mia, zac, zoe)
- 💾 Save audio to WAV files

## Quick Setup

1. Install [LM Studio](https://lmstudio.ai/) 
2. Download the [Orpheus TTS model (orpheus-3b-0.1-ft-q4_k_m.gguf)](https://huggingface.co/isaiahbjork/orpheus-3b-0.1-ft-Q4_K_M-GGUF) in LM Studio
3. Load the Orpheus model in LM Studio
4. Start the local server in LM Studio (default: http://127.0.0.1:1234)
5. Install dependencies:
   ```
   python3 -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```
6. Run the script:
   ```
   python gguf_orpheus.py --text "Hello, this is a test" --voice tara
   ```

## Usage (python)

```
python gguf_orpheus.py --text "Your text here" --voice tara --output "output.wav"
```
## Usage (bash)

The bash script, `orpheus_tts.sh`, provides a flexible way to run the `gguf_orpheus.py` Python script with various options, such as:

1. Pass direct text from the command line
2. Read text from a file using the `-f` or `--file` option
3. Select a voice using the `-v` or `--voice` option (defaults to "tara")
4. Display help with `-h` or `--help`

### How to use the script:

1. First, make it executable:
   ```bash
   chmod +x orpheus_tts.sh
   ```

2. Basic usage with direct text:
   ```bash
   ./orpheus_tts.sh "Hello, this is a test"
   ```

3. Using a different voice:
   ```bash
   ./orpheus_tts.sh -v leo "Hello, this is a test"
   ```
   or
   ```bash
   ./orpheus_tts.sh --voice zoe "Hello, this is a test"
   ```

4. Reading from a text file:
   ```bash
   ./orpheus_tts.sh -f my_text.txt
   ```

5. Combining options:
   ```bash
   ./orpheus_tts.sh --voice mia -f my_text.txt
   ```

### Options

- `--text`: The text to convert to speech
- `--voice`: The voice to use (default: tara)
- `--output`: Output WAV file path (default: auto-generated filename)
- `--list-voices`: Show available voices
- `--temperature`: Temperature for generation (default: 0.6)
- `--top_p`: Top-p sampling parameter (default: 0.9)
- `--repetition_penalty`: Repetition penalty (default: 1.1)

## Available Voices

- tara - Best overall voice for general use (default)
- leah
- jess
- leo
- dan
- mia
- zac
- zoe

## Emotion
You can add emotion to the speech by adding the following tags:
```xml
<giggle>
<laugh>
<chuckle>
<sigh>
<cough>
<sniffle>
<groan>
<yawn>
<gasp>
```

## License

Apache 2.0

