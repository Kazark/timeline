# Timeline

At the moment, a timeline of (Western) church history.

# Navigation

Move left with <kbd>H</kbd> or <kbd>LEFT ARROW</kbd>, and right with
<kbd>L</kbd> or <kbd>RIGHT ARROW</kbd>. To move faster, hold down the shift key
as well.

## Development

Restore Node dependencies (Elm will restore its own when you kick off the
build):

    npm install

Start local server in root directory with Python 2:

    npm run serve

or

    python -m SimpleHTTPServer 5000

Start local server in root directory with Python 3:

    npm run serv3

or

    python3 -m http.server 5000

Build project:

    npm run build  (or `npm run watch` for auto-rebuild on fs change)

Navigate to <http://localhost:5000> (which loads your `index.html`).

**Note:** Make your edits to `index.template.html` and consider `index.html` an
ephemeral file. This is because index.html gets overwritten easily. For
example, `elm make` overwrites it by default.
