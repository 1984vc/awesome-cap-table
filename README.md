# Awesome Cap Table

A fictional YC-style cap table you can inspect, fork, and use as a starting point. The [OCF 1.2.0](https://open-cap-table-coalition.github.io/Open-Cap-Format-OCF/) package in `minicap/` is the company record. The reports and workbook are generated from it with [MiniCap](https://github.com/1984vc/minicap).

Two founders hold common stock, with an unallocated option pool. Y Combinator has its two standard-deal SAFEs ($125,000 for a fixed 7% on conversion and $375,000 uncapped with MFN). An example investor has a $1 million SAFE at a $15 million post-money cap. No priced round has happened in the company record.

## View the cap table

| File | What it shows |
| --- | --- |
| [Current cap table (Markdown)](cap-table.md) | Current ownership, option pool, and the three outstanding SAFEs with their terms |
| [Download the Excel cap table](cap-table.xlsx) | OCX snapshot of issued stock and plan holdings; **outstanding SAFEs are excluded** from its ownership totals |
| [Scenario: $10m Series A on $40m post-money](scenarios/series-a-10-on-40/README.md) | A hypothetical round with SAFE conversions and a 10% target option pool; [view the inputs](scenarios/series-a-10-on-40/request.json) |

The scenario is a calculation, not a new transaction in `minicap/`. Its new investor, financing date, and valuation belong in the scenario request, leaving the current cap table intact.

## Try it with MiniCap

Install the `minicap` CLI from [GitHub Releases](https://github.com/1984vc/minicap/releases), or build current MiniCap from source if you want to reproduce these exact generated files. From this repository's root:

```bash
minicap validate
minicap report
minicap export ocx --output cap-table.xlsx
minicap report --round-request scenarios/series-a-10-on-40/request.json
```

Ask your agent: “What happens to founder ownership if we raise $10 million at a $40 million **post-money** valuation? Include the existing SAFEs and a 10% option pool. Put the inputs and modeled cap table in a new folder under `scenarios/`; don't change the OCF snapshot.” Say *pre-money* instead if that's what you mean by “10 on 40”—it changes the math.

To refresh the checked-in reports and workbook after changing the snapshot or a scenario, run `./scripts/update-exports.sh`. [AGENTS.md](AGENTS.md) has installation and editing instructions for agents.
