set -e

rm -rf src/components/ui pnpm-lock.yaml node_modules
jq 'del(.peerDependencies)' package.json > tmp.json && mv tmp.json package.json

pnpm install
pnpm add @tailwindcss/typography tailwindcss

# https://ui.shadcn.com/docs/installation/manual
pnpm add class-variance-authority clsx tailwind-merge lucide-react tw-animate-css
pnpx shadcn@latest add --all

node fix-imports.js

jq '.peerDependencies = .dependencies | del(.dependencies)' package.json > tmp.json && mv tmp.json package.json

pnpm tsc --noEmit
