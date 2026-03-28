 _______ _            ____            _
|__   __| |          |  _ \          | |
   | |  | |__   ___  | |_) | ___  ___| |_ ___  _ __
   | |  | '_ \ / _ \ |  _ < / _ \/ __| __/ _ \| '_ \
   | |  | | | |  __/ | |_) | (_) \__ \ || (_) | | | |
   |_|  |_| |_|\___| |____/ \___/|___/\__\___/|_| |_|

  _____      _ _   _
 / ____|    | | | (_)
| |     ___| | |_ _  ___ ___
| |    / _ \ | __| |/ __/ __|
| |___|  __/ | |_| | (__\__ \
 \_____\___|_|\__|_|\___|___/

> *"It's not about the X's and O's, it's about the Jimmies and the Joes."*
> — Red Auerbach

---

## What Is This?

A Ruby CLI gem that scrapes the live Boston Celtics roster from [Basketball Reference](https://www.basketball-reference.com), lets you pick any player from the list, and pulls their current season stats — all right in your terminal, rendered in green on black like the parquet floor it deserves.

This was one of the first projects I ever coded. It uses web scraping with Nokogiri, a touch of `tty-font` and `pastel` for the UI, and exits with a randomly pulled Red Auerbach quote because why not.

---

## Installation

```bash
git clone https://github.com/fizzleRaider7645/celtics_roster
cd celtics_roster
bundle install
```

---

## Usage

```bash
bin/celtics_roster
```

1. The full roster loads automatically from Basketball Reference.
2. Enter the **list number** next to the player you want.
3. Their current season stats are displayed.
4. Type `exit` to quit — and get a parting Red Auerbach quote.

---

## What You'll See

```
 _______ _            ____            _
|__   __| |          |  _ \          | |
   | |  | |__   ___  | |_) | ___  ___| |_ ___  _ __
   ...

1 - Jayson Tatum - SF
2 - Jaylen Brown - SG
3 - Kristaps Porzingis - C
...

Select the player's 'list number' to see current season stats, or enter 'exit':
```

---

## Tech Stack

- **Ruby** — core language
- **Nokogiri** — HTML scraping
- **open-uri** — fetching remote pages
- **tty-font** — that sweet doom-font header
- **pastel** — terminal colors and styling

---

## Dependencies

```ruby
gem 'tty-font'
gem 'pastel'
gem 'nokogiri'
```

---

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/fizzleRaider7645/celtics_roster](https://github.com/fizzleRaider7645/celtics_roster).

---

## License

MIT — see [LICENSE.txt](LICENSE.txt).
