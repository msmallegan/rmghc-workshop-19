#!/usr/bin/env nextflow
params.name             = "RNA-seq"
params.reads            = "/data/fastq/*{*_R1,*_R2}.fastq.gz"
params.email            = "michael.smallegan@colorado.edu"


log.info "RNA-seq Pipeline"
log.info "====================================="
log.info "name         : ${params.name}"
log.info "reads        : ${params.reads}"
log.info "email        : ${params.email}"
log.info "\n"


reads = Channel.fromFilePairs(params.reads, size: -1)
// this is a nextflow comment
process view_reads {

  publishDir "results"

  input:
  set val(id), file(files) from reads

  output:
  file "*.txt"

  script:
  """
  # comment
  zcat ${files[[1]]} | head > ${id}_reads.txt
  """
}
