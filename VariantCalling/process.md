# VariantCalling process
1. BWA 설치
   - BWA 설치 경로 만들기
   - BWA git hub에 있는 command line 수행
   - 링크 걸기
     ```
     sudo ln -s ~/etc/bwa/bwa/bwa /usr/bin/bwa
     ```
   - 확인
       ```
       which bwa
       ```  
2. Download reference genome
   - ucsc genome browser 검색
   - download 탭 클릭
   - 주소 복사
   - 주소로 다운받기
     ```
     mkdir -p ~/etc/reference
     ```
     ```
     wget [주소]
     ```  
3. BWA index 파일 만들기
   - index 파일 생성하기
     ```
     bwa index [reference.fasta]
     ```
     
4. FastQ 샘플 파일 다운로드
   - 경로 생성
     ```
     ~/Analysis/sample
     ```
   - 파일 다운로드
       
5. Align, Sort, Index 과정  
   - Mapping to reference
     ```
     bwa mem -t 1 -R "@RG\tID:sample\tSM:sample\tPL:platform" ~/etc/reference/chr21.fa.gz sample_1.fastq.gz sample_2.fastq.gz > sample.chr21.sam
     ```
   - SAM to BAM
     ```
     samtools view -Sb sample.chr21.sam > sample.chr21.mapped.bam
     ```
   - BAM sorting
     ```
     samtools sort sample.chr21.mapped. bam -o sample.chr21.sorted. bam
     ```
   - BAM indexing
     ```
     samtools index sample.chr21.sorted.bam
     ```
  6. samtools view로 살펴보기
     - tview : '/'키 입력 후 position 입력





