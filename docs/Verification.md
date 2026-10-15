# Verify an installation

The `Verify published installation` workflow installs a pinned public release
through Homebrew and the checksummed installer, then executes a Podfile hook and
an offline deployment reinstall. It records results separately on Apple Silicon
and Intel runners. It does not publish releases or choose signing identities.

Supply all three workflow inputs:

- `version`: the published version without its `v` prefix.
- `manifest_sha256`: the independently verified SHA-256 of `release.json`.
- `tap_revision`: the full Git commit containing that release's formula.

The workflow verifies that the formula's URL and checksum match the selected
architecture's release asset. It also verifies the installer's checksum before
executing it. A missing release, missing architecture or changed checksum fails
the job. Logs are retained as `installation-<runner>` artifacts.

Source compatibility CI tests prepared packages through a temporary tap before
publication. This workflow checks the final public download path after a release
exists. Neither runner compilation nor a newer macOS runner proves execution on
the minimum supported macOS or on a physical Apple device.

## Collect independent evidence

Keep the full packaged run and independent gate artifacts from the same clean
source revision. The source runner accepts `--external-evidence FILE` when those
artifacts are available before a full run. To attach newly completed independent
checks to an existing full run, use:

```sh
python3 scripts/collect-external.py \
  --source-checkout ../swiftpods-code \
  --evidence /path/to/full-evidence.zip \
  --external-evidence /path/to/external.json \
  --destination /path/to/combined-evidence.zip
```

The collector uses the matching source checkout's acceptance validator, rechecks
all current report and executable hashes, and includes each external artifact
in the portable archive. It preserves the original full run and does not rerun
or replace its tests. Missing gates remain unverified. Supply the combined
archive when assembling release assets from the matching source checkout.
