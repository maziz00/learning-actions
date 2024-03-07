[1mdiff --git a/.github/workflows/06-contexts.yaml b/.github/workflows/06-contexts.yaml[m
[1mindex be5d312..ff6c9fd 100644[m
[1m--- a/.github/workflows/06-contexts.yaml[m
[1m+++ b/.github/workflows/06-contexts.yaml[m
[36m@@ -15,14 +15,12 @@[m [mjobs:[m
                 echo "Ref: ${{ github.ref }}"[m
                 echo "SHA: ${{  github.sha }}"[m
                 echo "Actor: ${{ github.actor_id}}"[m
[31m-                echo "Workflow: ${{ github.workflow.name }}"[m
[32m+[m[32m                echo "Workflow: ${{ github.workflow }}"[m
                 # echo "Workflow Name: $(basename $GITHUB_WORKFLOW_PATH .yml) >> echo $GITHUB_ENV"[m
                 echo "Run ID: ${{ github.run_id }}"[m
                 echo "Run number: ${{ github.run_number}}"[m
                 echo "Repository: ${{ github.repository }} on branch: $(basename ${{ github.ref }})"[m
 [m
             - name: Retrieve Variable[m
[31m-              env:[m
[31m-                MY_VAR: ${{ env.MY_VAR }}[m
               run: |[m
[31m-                echo "$MY_VAR"[m
[32m+[m[32m                echo "${{ vars.MY_VAR }}"[m
