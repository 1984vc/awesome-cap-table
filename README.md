# Awesome Cap Table

A fictional YC-style cap table you can inspect, fork, and make your own. The company record lives in `minicap/` as [OCF 1.2.0](https://open-cap-table-coalition.github.io/Open-Cap-Format-OCF/). [MiniCap](https://github.com/1984vc/minicap) generates the reports and workbook; your coding agent can handle that part.

## Get started

Clone this repository (or fork it first), then open the folder in the coding editor or coding agent of your choice:

```bash
git clone git@github.com:1984vc/awesome-cap-table.git
```

Here's an example prompt you can give your agent:

> What happens to founder ownership if we raise $10 million at a $40 million **post-money** valuation? Include the existing YC and angel SAFEs and a 10% option pool. Create or update `scenarios/series-a-10-on-40/` with the assumptions and a Markdown cap table showing ownership before and after. Don't change the recorded cap table in `minicap/`.

The agent can follow [AGENTS.md](AGENTS.md) to set up MiniCap and work with the OCF files. If you mean **pre-money** by “10 on 40,” say so: it changes the result.

## What's in the example

Two founders hold common stock, with an unallocated option pool. Y Combinator has its two standard-deal SAFEs ($125,000 for a fixed 7% on conversion and $375,000 uncapped with MFN). An example investor has a $1 million SAFE at a $15 million post-money cap. No priced round has happened in the company record.

## View the cap table

| File | What it shows |
| --- | --- |
| [Current cap table (Markdown)](cap-table.md) | Current ownership, option pool, and the three outstanding SAFEs with their terms |
| [Download the Excel cap table](cap-table.xlsx) | OCX snapshot of issued stock and plan holdings; **outstanding SAFEs are excluded** from its ownership totals |
| [Scenario: $10m Series A on $40m post-money](scenarios/series-a-10-on-40/README.md) | A hypothetical round with SAFE conversions and a 10% target option pool; [view the inputs](scenarios/series-a-10-on-40/request.json) |

The scenario is a calculation, not a new transaction in `minicap/`. Its new investor, financing date, and valuation belong in the scenario request, leaving the current cap table intact.
