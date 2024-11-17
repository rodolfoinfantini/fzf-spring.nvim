local M = {}

M.prompts = {
    ALL = "Spring Endpoint: ",
    GET = "Spring GET Endpoint: ",
    POST = "Spring POST Endpoint: ",
    PUT = "Spring PUT Endpoint: ",
    DELETE = "Spring DELETE Endpoint: ",
    PATCH = "Spring PATCH Endpoint: ",
}

M.methods = {
    GET = "GET",
    POST = "POST",
    PUT = "PUT",
    DELETE = "DELETE",
    PATCH = "PATCH",
}

M.annotation = {
    REQUEST_MAPPING = "@RequestMapping",
    GET_MAPPING = "@GetMapping",
    POST_MAPPING = "@PostMapping",
    PUT_MAPPING = "@PutMapping",
    DELETE_MAPPING = "@DeleteMapping",
    PATCH_MAPPING = "@PatchMapping",
}

M.cmd = {
    GET_ROOT = "git rev-parse --show-toplevel",
    GREP = "grep",
}

M.args = {
    EXACT = "-E",
    ALL_JAVA_FILE = "/**/*.java",
}

return M
