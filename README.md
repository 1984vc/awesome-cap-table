# Example YC-style cap table

A small, fictional [OCF 1.2.0](https://open-cap-table-coalition.github.io/Open-Cap-Format-OCF/) cap table for trying [MiniCap](https://github.com/1984vc/minicap) or starting your own. The company has two founders, an unallocated option pool, and three outstanding SAFEs. It has not raised a priced round.

| Holder | Instrument | Terms |
| --- | --- | --- |
| Y Combinator | $125,000 SAFE | Fixed 7% on conversion |
| Y Combinator | $375,000 SAFE | Uncapped, with MFN |
| Example Angel Fund | $1,000,000 SAFE | $15 million post-money valuation cap, no discount |

The YC terms follow [YC's published standard deal](https://www.ycombinator.com/deal). The founders, company, angel, dates, and share counts are invented. YC's separate agreement and pro-rata rights are not modeled here.

## Get MiniCap

Download the `minicap` binary for your computer from [MiniCap releases](https://github.com/1984vc/minicap/releases), then put it on your `PATH`. Or, with Rust 1.88 or newer and access to the MiniCap repository, build and install it from source while in this directory:

```bash
git clone git@github.com:1984vc/minicap.git ../minicap-src
cargo install --path ../minicap-src/crates/minicap-cli --locked
```

## Try the cap table

Run these from this repository's root. MiniCap automatically finds the `minicap/` OCF package.

```bash
minicap validate
minicap report
minicap export ocx --output cap-table.xlsx
```

The report shows founder stock and the unused pool as current ownership. The SAFEs appear separately: they have no issued shares yet, and their conversion depends on a future financing. The Excel export likewise excludes outstanding SAFEs from its ownership totals.

To make this your own, fork the repository and edit the files under `minicap/`. Every referenced file has an MD5 checksum in `minicap/Manifest.ocf.json`; update those checksums after editing, then run `minicap validate`. See [AGENTS.md](AGENTS.md) for the editing conventions.
