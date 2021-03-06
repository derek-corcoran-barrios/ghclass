github_api_repo_get_file = function(repo, path, branch = NULL) {
  arg_is_chr_scalar(repo, path)
  arg_is_chr_scalar(branch, allow_null=TRUE)

  ghclass_api_v3_req(
    endpoint = "GET /repos/:owner/:repo/contents/:path",
    owner = get_repo_owner(repo),
    repo = get_repo_name(repo),
    path = path,
    ref = branch
  )

}


#' @rdname repo_file
#'
#' @export
#'
repo_get_file = function(repo, path, branch = NULL, quiet = FALSE, include_details = TRUE) {
  arg_is_chr_scalar(repo, path)
  arg_is_chr_scalar(branch, allow_null = TRUE)

  file = purrr::possibly(github_api_repo_get_file, NULL)(repo, path, branch)
  extract_content(repo = repo, path = path, file = file,
                  include_details = include_details, quiet = quiet)
}
