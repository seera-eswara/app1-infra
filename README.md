app1-infra/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── dev.tfvars
│   │   └── backend.tf
│   ├── stage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── stage.tfvars
│   │   └── backend.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── prod.tfvars
│       └── backend.tf
├── modules/              # OPTIONAL: thin wrappers only
├── README.md
└── .github/workflows/
    └── app-iac.yml       # thin caller only
