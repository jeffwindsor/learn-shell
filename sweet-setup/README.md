[Home](https://jeffwindsor.carrd.co/) > [Github](https://jeffwindsor.github.io/) > [Projects](https://jeffwindsor.github.io/projects) > The Sweet Setup

## Generation of Scripts

Sweet sweet setup scripts for your new machine images.  Run your OS specific script directly from the raw url or clone the repo and run them locally, its up to you.

There are two main generation scripts found in the `src` directory:

* `generate-includes` - this script generates, compiles and manipulates files in the `src/include`, especially those generated for data files like `data-aliases.sh`.
* `generate-standalone-scripts` - this script generates all the standalone scripts in the root directory from the content in the `src/includes`.  This scripts run `generate-includes` as part of its setup.

## Generation Conventions

* The `generate-standalone-scripts` by convention only concatenates files from the `src/include` folders into output scripts in to `root` folder.
* The `generate-includes` by convention only `data-*` files are converted to `src/include` files.

## Stand Alone Script Conventions

* When executed the standalone scripts will confirm the execution of the following scripts in this order:
  * `preinstall.*` functions
  * `install.*` functions
  * `postinstall.*` functions
* Execute all confirmed functions

## Direct Execution of Generated Scripts

|Script|Command|
|---|---|
|Setup Manjaro|`bash <(curl -L https://git.io/fA63q)`|
|Setup MacOs|`bash <(curl -L https://git.io/fA63t)`|
|Setup Ubuntu|`bash <(curl -L https://git.io/fAX9h)`|
|Add Git Workflow|`bash <(curl -L https://git.io/fA63k)`|
|Add Git Workflow CJ|`bash <(curl -L https://git.io/fA63f)`|

## Manual Setups

### GOOGLE Custom Search Engine Definitions

|Name|Alias|Search Url|
|---|---|---|
CJ Pad | p | `http://cjpad.cj.com/%s`
CJ Pad story | ps | `http://cjpad.cj.com/CJPM-%s`
CJ Url | u | `http://cjurl.me/%s`
CJ Gitlab | gl | `http://gitlab.cj.com/search?utf8=%E2%9C%93&search=%s&group_id=&repository_ref=`
CJ Jira | j | `https://jira.cnvrmedia.net/secure/QuickSearch.jspa?searchString=CJPM-%s`
Gist | gs | `https://gist.github.com/search?q=%s&ref=opensearch`
GitHub | gh | `https://github.com/search?q=%s&ref=opensearch`
Hoogle | h | `https://www.haskell.org/hoogle/?hoogle=%s`
Stack Overflow | so | `http://stackoverflow.com/search?q=%s`
Firebase | fb | `https://firebase.google.com/s/results?q=%s`
Amazon | a | `https://www.amazon.com/s/ref=nb_sb_ss_i_3_8?url=search-alias%3Daps&field-keywords=%s&sprefix=coasters%2Caps%2C208&crid=2MKNA1PJAMBYR`
Audible | ad | `https://www.audible.com/search?keywords=%s&ref=a_hp_t1_header_search`
Google Drive | d | `https://drive.google.com/drive/search?q=%s`
Wikipedia | w | `https://en.wikipedia.org/w/index.php?title=Special:Search&search=%s`
YouTube | y | `https://www.youtube.com/results?search_query=%s&page={startPage?}&utm_source=opensearch`

## Contribution Guidelines

* Add static includes to the folder that matches its purpose (or create new ones)
* Add a `generate-includes` section for generating any dynamically created scripts
* Add any new standalone script to `generate-standalone-scripts`

## Credits

* [Fish Shell](https://fishshell.com/docs/current/index.html)
* [Git Ascii Art Logo - Xero](https://gist.github.com/xero/3625973)
* [Fish Logo - laughedelic](https://github.com/laughedelic/fish_logo)
* [Apple Logo](https://www.asciiart.eu/computers/apple)
* [Cats on Fence](https://user.xmission.com/~emailbox/ascii_cats.htm)
