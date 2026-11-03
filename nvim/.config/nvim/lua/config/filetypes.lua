-- Extra filetype rules (:h vim.filetype.add()).

-- helm charts
vim.filetype.add({
	filename = {
		["Chart.yaml"] = "helm",
	},
	pattern = {
		[".*%.tpl"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
	},
})

-- ansible: composite ft "yaml.ansible" (yaml looks, ansiblels matches)
vim.filetype.add({
	pattern = {
		[".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
		[".*/tasks/.*%.ya?ml"] = "yaml.ansible",
		[".*/handlers/.*%.ya?ml"] = "yaml.ansible",
	},
})
