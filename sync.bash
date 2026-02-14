set -e

rm -rf src/components/ui

# https://ui.shadcn.com/docs/installation/manual

mv package.json package.json.bak
cat package.json.bak | jq '.dependencies = {}' > package.json
rm package.json.bak
pnpm install

pnpm add class-variance-authority clsx tailwind-merge lucide-react tw-animate-css react-resizable-panels @base-ui/react @tailwindcss/typography
pnpx shadcn@latest add --all

node fix-imports.js
pnpm tsc --noEmit
