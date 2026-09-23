# Awesome Cap Table

**Let your agent manage your cap table.**

Give your agent the facts about your company. It can ask for what's missing, turn this starter into your cap table, and refresh the Markdown and Excel views as your records change.

## Make it your company's cap table

Fork [Awesome Cap Table](https://github.com/1984vc/awesome-cap-table/fork), clone your fork using its GitHub clone URL, and open the folder in the coding editor or coding agent of your choice. If you just want to look around first, clone the example:

```bash
git clone git@github.com:1984vc/awesome-cap-table.git
```

Here's an example prompt you can give your agent:

> Help me turn this into my company's cap table. Read `AGENTS.md` and ask me for the company details, founders, issued shares, option pool, and any investments or SAFEs. Replace the fictional records with my real information, validate the OCF package, and update `cap-table.md` and `cap-table.xlsx`. Don't guess missing terms or share counts.

The agent can follow [AGENTS.md](AGENTS.md) to get MiniCap and update the files. You review the facts before committing them to your fork.

## What's in the example

The starting data is fictional: two founders hold common stock, with an unallocated option pool. It also includes YC's two standard-deal SAFEs ($125,000 for a fixed 7% on conversion and $375,000 uncapped with MFN) and an example $1 million SAFE at a $15 million post-money cap. These are sample records to replace, not assumptions about your company.

## View the cap table

| File | What it shows |
| --- | --- |
| [Current cap table (Markdown)](cap-table.md) | Current ownership, option pool, and the three outstanding SAFEs with their terms |
| [Download the Excel cap table](cap-table.xlsx) | OCX snapshot of issued stock and plan holdings; **outstanding SAFEs are excluded** from its ownership totals |

Your agent can regenerate both linked files as your company's records change. Under the hood, `minicap/` holds the [OCF 1.2.0](https://open-cap-table-coalition.github.io/Open-Cap-Format-OCF/) company record; [MiniCap](https://github.com/1984vc/minicap) validates it and renders the reports.
