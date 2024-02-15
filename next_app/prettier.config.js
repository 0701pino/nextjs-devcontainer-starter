/** @typedef {import("@ianvs/prettier-plugin-sort-imports").PluginConfig} SortImportsConfig */
/** @typedef {import("prettier").Config} PrettierConfig */

/**
 * Remember to restart VSCode after making
 * any changes here and saving this file.
 */
/** @type {PrettierConfig | SortImportsConfig} */
module.exports = {
  printWidth: 100,
  plugins: ["@ianvs/prettier-plugin-sort-imports", "prettier-plugin-tailwindcss"],
  importOrder: [
    "<BUILTIN_MODULES>",
    "",
    "^(^react$|@react|react)",
    "^(next/(.*)$)|^(next$)",
    "",
    "<THIRD_PARTY_MODULES>",
    "^@[^/](.*)$",
    "",
    "^@/(.*)$",
    "^[../]",
    "^[./]",
    "",
    "<TYPES>",
    "<TYPES>^[.]",
    "",
    "^(?!.*[.]css$)[./].*$",
    ".css$",
  ],
  importOrderParserPlugins: ["typescript", "jsx"],
  importOrderTypeScriptVersion: "5.3.3",
};
