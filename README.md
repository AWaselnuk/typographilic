# Typographilic

Typographilic is a simple tool for creating typographic scales and systems.

## Installation

Typographilic works the exact same in any javascript runtime (browser or Node.js for example).

    npm install typographilic

Then in your project:

    var typographilic = require('typographilic');

## Usage

Typographilic offers a single method.
To create a simple modular scale, simply pass in your scale factor, base line height, and base font size (in pixels):

    var typography = typographilic.scale(1.618, 1.4, 16);

To create a multi stranded modular scale, simply pass in an array of base sizes as the last argument:

    var typography = typographilic.scale(1.4, 1.618, [12, 16]);

## Support

Simply file an issue here in Github.

## Contributing

Please include a test for new features following the existing testing patterns.
Note that this project is written in Coffeescript and is tested with Chai and Mocha.

## License

The MIT License (MIT)

Copyright (c) 2015 Adam Waselnuk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
