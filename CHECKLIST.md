# Company record checklist

This is a review procedure for your agent, not a list of boxes to check once. Compare the files you have with the company facts and the OCF records in `minicap/` each time you review the repository. Report **found**, **missing**, or **needs confirmation**, with paths to the evidence. A file's presence does not establish that it was signed, filed, or effective.

## Formation

- Is the certificate of incorporation in `formation/`? Do its company name and formation date agree with the OCF issuer?
- Are the bylaws, initial board consent, and EIN confirmation present? If an item has not been provided, ask where it is or whether it exists.

## Each founder

Ask who the founders are and match each one to an OCF stakeholder and their stock issuance. Under `founders/<stakeholder-id>/`, look for:

- A stock purchase agreement whose holder and shares agree with the recorded issuance.
- An IP assignment.
- If the founder received restricted or vesting stock, ask whether an 83(b) election applies. Look separately for the election **and** proof of filing. If only one is present, say which evidence is missing; do not infer filing from a completed election form.

For example: “Alex and Sam both have stock issuances. I found Alex's 83(b) election but none for Sam, and I found no filing proof for Alex. Was Sam's stock subject to vesting, and do you have either missing record?”

## Option plan (if the OCF package has one)

- Is the plan document in `option-plan/`? Is its adoption approval available?
- For any recorded grants, can you find the supporting grant documents? Compare grant holders and quantities with OCF.

## SAFEs (one review per recorded issuance)

For each `TX_CONVERTIBLE_ISSUANCE` in `minicap/Transactions.ocf.json`, look in `safes/<security-id>/` for the signed SAFE. Ask about any side letter and approval rather than assuming one exists. Compare the named investor, amount, date, cap, discount, and MFN terms with OCF. Also ask about any SAFE documents that have **no** corresponding OCF transaction.

## Give the founder a useful answer

List the documents found, missing records, and facts needing confirmation, grouped by area. Name the relevant founder or SAFE and file path. Keep the review distinct from `minicap validate`, which checks the OCF package rather than the corporate document folders.
