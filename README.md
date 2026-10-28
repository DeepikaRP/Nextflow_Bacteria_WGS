# Nextflow Bioinformatics Pipeline

A bioinformatics workflow developed using **Nextflow DSL2** to practise workflow automation and build a modular, reproducible NGS analysis pipeline.

**Project status: In progress** — currently implemented through the alignment stage, with additional steps being developed.

## Overview

This project focuses on building a modular NGS workflow using Nextflow DSL2. The pipeline is being developed incrementally, with individual processes organised into reusable modules.

The goal is to improve workflow reproducibility, process management, and scalability while gaining practical experience in bioinformatics pipeline development.

## Workflow Progress

- **Quality control** — FastQC
- **Read preprocessing** — Fastp
- **Reference indexing & Read alignment** — SamTools & BWA
- **Variant calling and downstream analysis** — BCFTools, SNPEff, VEP

## Project Structure

```text
.
├── main.nf
├── nextflow.config
├── modules/
│   ├── FASTQC.nf
│   ├── FASTP.nf
│   └── REF_INDEX.nf
├── data/           # Input data; not committed to GitHub
├── results/        # Generated outputs; not committed to GitHub
└── README.md
```

*The directory structure may evolve as additional modules are added.*

## Development Status

This is an actively maintained learning project. New workflow steps, improvements, and documentation will be added as development progresses.

## Future Improvements

- Implement post-alignment processing
- Add variant calling and annotation
- Improve workflow configuration and resource management
- Add execution instructions and test the complete workflow
- Explore containerised execution and remote workflow execution
