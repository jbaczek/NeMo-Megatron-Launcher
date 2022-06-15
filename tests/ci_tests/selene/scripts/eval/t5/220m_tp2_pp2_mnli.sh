HYDRA_FULL_ERROR=1 python3 main.py \
    +ci_test=True \
    evaluation=t5/mnli_matched \
    run_data_preparation=False \
    run_training=False \
    run_conversion=False \
    run_finetuning=False \
    run_evaluation=True \
    bignlp_path=${GIT_CLONE_PATH} \
    data_dir=${BASE_RESULTS_DIR}/data \
    base_results_dir=${BASE_RESULTS_DIR} \
    "container='${BUILD_IMAGE_NAME_SRUN}'" \
    cluster.partition=${SLURM_PARTITION} \
    cluster.account=${SLURM_ACCOUNT} \
    cluster.gpus_per_task=null \
    cluster.gpus_per_node=null \
    cluster.job_name_prefix="${SLURM_ACCOUNT}-bignlp_ci:" \
    evaluation.run.time_limit="01:00:00" \
    evaluation.run.results_dir=${BASE_RESULTS_DIR}/${RUN_NAME} \
    evaluation.trainer.num_nodes=1 \
    evaluation.model.restore_from_path=${BASE_RESULTS_DIR}/finetune_t5_220m_tp2_pp2_2node_100steps_mnli//checkpoints/megatron_t5_glue.nemo