# Copyright 2019 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

context('test bcdc_search')


test_that('works with a record that has no resource', {
  skip_on_cran()
  skip_if_net_down()
  output_path <- tempfile()
  suppressWarnings(
    verify_output(output_path, {
      bcdc_search("Major Railways")
    })
  )
  expect_false(any(grepl("Error", readLines(output_path))))
  expect_true(any(grepl("no resources", readLines(output_path))))
})
