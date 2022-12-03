defmodule Day3 do

  def get_rucksacks() do
    input()
    |> String.split("\n")
    |> Enum.map(fn x -> String.trim(x) end)
  end

  def get_compartments(sack) do
    len = String.length(sack)
    %{'c1' => String.slice(sack, 0..div(len,2)-1), 'c2' => String.slice(sack, div(len,2)..len)}
  end

  def get_common(%{ 'c1' => c1, 'c2' => c2 }) do
      List.first(get_common(c1,c2))
  end

  def get_common(item1, item2) do
      MapSet.to_list(
        MapSet.intersection(
          MapSet.new(String.to_charlist(item1)),
          MapSet.new(String.to_charlist(item2))
        )
      )
  end


  def rucksacks_common() do
    get_rucksacks()
    |> Enum.map(fn x -> get_compartments(x) end)
    |> Enum.map(fn x -> get_common(x) end)
  end

  def get_priority(type) when type < 97 do
    type - 38
  end

  def get_priority(type) when type > 96 do
    type - 96
  end

  def rucksack_priorities() do
    rucksacks_common()
    |> Enum.map(fn x -> get_priority(x) end)
  end

  def answer1() do
    rucksack_priorities()
    |> Enum.sum()
  end

  def get_groups() do
    get_rucksacks()
    |> Enum.chunk_every(3)
  end

  def get_group_common([s1, s2, s3]) do
    commons = List.to_string(get_common(s1,s2))
    List.first(get_common(commons,s3))
  end

  def get_group_commons() do
    get_groups()
    |> Enum.map(fn x -> get_group_common(x) end)
  end

  def answer2() do
    get_group_commons()
    |> Enum.map(fn x -> get_priority(x) end)
    |> Enum.sum()
  end

  def input() do
    "lDDWVvlVVQfDMlWjGJTRjQCgTGLCLj
    ZLZpwzLBhwZhSLBsjntGCtgJRjbnJgSG
    qppdZzzsdsmZphrNsNwZhllDHLcVVDWFPvFWcWdFlv
    ztdhgJDBJghmQtPFQPpmbw
    lVlLRcnfllcfVcccGnSQVLcsTPFbpwsPFspTSqmbpswpbF
    cCHRGcGcCRGlGrGcVGnrdWHWBDzBNhhQZWWNBhJz
    NfnSSQpdnRSSpvWdSsjZDGNDjGDwTGTjHG
    wlPzPqzPFbMmqPCFCJmbsjbHLDDHDZjDjbGHsT
    gwMlgmtmPcqVVvhVnvcRnn
    cBNBBCHhbhNhblBcCCvcBHSwTwDQSqRwDQpDRsjHST
    dPmzMVWdmmMnnZJtZVdqjTSrjTjrpQrsTTVwQRSj
    qzmZMmdZPtnGqclblGlbGvgBFc
    ZfpmNDfRhzbbqDnD
    SFtFjTTZVTFvVTjHrsVvqGBJqhnSSnbJznLGJwJq
    TjdPPtdMPPWCcZgW
    qsbmGCsjHNhmhmhzTDznpnlQZlbWlZ
    LTSSfSvggVVgBgfLtvvtTSczzpWnZQZnlnzpBcnWpQWc
    FrLvrrrVPgdPftSHHdNsjTHjmGThhm
    wGQlMjvMwpvjvZjZTZlWjplWJJTggDTgfCnntPgTJPbtPgSP
    qNhJmcVmdJqhHnPnDNtnPDCg
    LrrchqhRdLVzRdmhJcFFQWGGMjpGlvZzlQQv
    ZqZMbZMfQZptpjlF
    PJCggvHlwWHvSSvCJNvSPvDBtFDQThFQjtRQhhFTsVThQtsF
    PwWCnBBCClcMMznMdG
    rNwwQJrJrnQswrQrRRwCShBSLndZpdnhpGFSdhBp
    PvzzWVzbclGFhLFGdZll
    VWjPWvbjcVbVcGVzjcgzgwQQRRRrqwRJQwwstCRR
    zjBMMzznjbssrBrMBbvHDmrlprlrpwGpwQDV
    LhRwPPTLLNRZqScPWPWPTSmQvQQDGGdQHVDlmVpQGD
    NtfhNwhLLNwRwRNcTBgnJMCBzsBFjsJfCz
    jZjsWNDlPfClfMlM
    GjqbVSqjhgvgSVSBCPmMmCmfpwTBfh
    nGbjqtqcGzsLDFcJLs
    ZQtmZdtdQcLndRncdQQLFjWWDHNPfhpnqhqsHNNDnpHs
    TrMBGbJTwwlmDPPPWshWHfJq
    wmVzbrwbwvBlBlVGtSVLSdFjdFtdjLVR
    LBhZFhRPbbnPddMdPPlD
    NQszQNczlCSlJSsg
    mwmrVQwpQVWwTlvBpHHHFhZj
    pzzDffWpQBzMpHvzMfRnTNhZdrdBcnLrcdrTLZ
    msgJgtmbgmqJJcdrGcJjGn
    bSVPgwntmVnngQWvWSSMpMMHWH
    gmGMDHHdpngdrGmGcwbNCCnNcbbCSLwL
    zQPPPffQQlVlsPFQFzQchZZbLZNVcbqbNqbZgq
    PRjQzfRgRfjQBTfJQTlPFRHWmmvmWHGWrWvWWtjrdHpD
    vfrHfqrLfLwwNHdvnthpnnFFpstn
    gWcMclgmcRcWgDMWgBgGGFnntqQnGphdQhtbdFnh
    qRWmRDlcDqWBBPwPNrZHrwSHjTfr
    HVVbhdCdndhZSShMzRrzSM
    qBjWqvtWvDJjTjjGJtJtnqBvZMrgSGZlgfSgSRrMQGQRMgMR
    wmwtJsvjtTJwsNnVsHpdnsHdds
    FCJNZDMPNCNvzqQJHqzGqv
    hwjWcSTHwRpSWnQtGgQgGStgQQ
    WpwhRHTRpcLRjwlwwTWBcWdlFbCrsPrrLCMDrZCFsCDPrZPM
    DJjjShSGhGDSNdpfrWWcLFzrDWrDlF
    wtqZgwMBBPVMCBPQggMwqMMzfLlWrWLLzsWcFzTzVTzLss
    tgtwQqZBQQZbBZtPgbHpNJnJShcmJppSHh
    tHrWmrdzzdHflmHmHrSmqswlqhqNgssMhGgghssn
    pJcCBPPQPCcPpRpgwZNZBMnDhMsMBw
    RJCvRRVcQpjLpCJPWrftWvSnrFffWbrz
    jzlwwzDzTlQftzlWjfrBGBgVHBgpgBtPGVtP
    vhsshbMbNhZpgZrrrpHcZr
    qhdMqqSLSSbSJMqqSwwjzFzmjFQQFfHzLQ
    gDhHNnphPPPNCprHFhHFdbdczzjNqbzjVcdbQTcc
    tVJWBtVVZRWtjQbctjqcdj
    RfvlGLvLLLlLMZBmZBRhHDVPnVHPHCgFCnhlpn
    RFhZFTZvFdjlqqlRNCPwSSPCNPBSwC
    spHGswpnWgJLLJCPGg
    cWpDrVVbWfWbVfbsdQqcQzjjzlhdwqll
    WWJPpQwWdQQPNpQvqlvvCblbvbvwLL
    cmRMBMBTbSrTDRMcGBscTGfLZfvfvsCqhLlChZlLhfsC
    TVbzGSMGVVgdpdPJpQ
    lwsFfsZWGsGmsnlGQcPdBBdMbcPHfcCN
    RVvSLtSTrTVrTFPcBdCHRcPHbNNb
    LrqzLFTLrgSJLLLtTgJjVJvWlDDnjDWnWWlhlGWGhZWZhn
    GQJCMGbrMbbCGrrGtcwhctGjNSvWpVVVRjNJqVqqBBRRJq
    ssnglHHsnHzFmHnzHFPVDDSDRgVjvWDNpSSNpB
    PZfHmndFzzfPZPZfCdwchwGcbwwhCdMW
    DRGVQGmGQVnnGVmnnFpNbzCNRbRttCbpLztC
    qdqHBdjTqPlcTchBjJMvvvLtLCcLggLvtmgb
    fqhlHjdwqjjJTwldDmDmrGrrWFrDGZwD
    wFscLVLrrVhwWgZPrcswgZWFTnQdtTMnpQtjdpqdqvqQMt
    JRbHmmbDDSzDmDNpTnBBdpMHQtqtvp
    JmCCbvRGzbbGJsLgZsVhgLwwGW
    WDQwsBzWbBlMjdVpzTJVMj
    fncRngntnPCpJgmdFpFWgm
    RGZPZtZCfvWSvRZGSLvPccHwsrHbwHLrwHHQQsBDbllB
    PlNZhwgpppccgrqVvttbBfrlls
    CznSDDdHDRnRStVsVfDvfrtDZq
    QCddZFSFLTmccQmw
    rnwfVnclGPPFfSPSqBWZvvBBWqZvqWFh
    zLgLQgJssspmQTJmsgjZNmqqzqdHbthDdDDWHbhqBBqb
    QgmmjpNgCCZpjJLpmTrfrSrVRPfnrClfPwnS
    zDzPPwvwqvPPBqjnqvDqBffSfcSNJpNVfccLLNffBR
    MdTMZbgbmmTWGGdmssRCSNsSNVVVcJsNppsC
    MJghbhHhbtMMdWhbJhHgdmWvnFzHDQPDjQDvHHwvQwvzwF
    gGbqqRDrqDMdcBpVlpMG
    WzhPCnWfqMcpBnnNLZ
    fCqPHHJCfJhStwhWHbrrgvjFgbQbSbmbQs
    fhcchnSpfsNpjVVqnqjrGHqq
    zzlFLlPLWdggFqRBjqsrHrBTzz
    FDwgFLZWlbbchpwshsCNcw
    CmPlqqRJDHRDDsFv
    MfSpBQQNNfBfrfVZsmVVdzzrHZmH
    QSBSLSgmQBmwPCtgClhjPP
    NPNsHHHNsPsvHwDqgpwlqt
    rTRWSRrWRzgTzZrRVVLRQzjpbtmmGLlGDDbDwwmtblvDvw
    nRzSRrjSVRrnjrgZfrfzNdPdMPBfBMhJhhBcPhcJ
    LLhzQSDHDHNpNzHHJBQBMvMBqBRJBBqw
    rmbdtmlWCCMnvJrn
    FTVdmVgtjdtbWsvjjmdLSDcgHpDzShzDLPLSHh
    VFFJQVWHtQVHHWbJRRRHwqPvpMLpLZZWLwlwMllL
    jsngsdGssLvlqnZqZw
    hhmfDjDsmDNjjNRNVqNVJRtQHJ
    jvTnffrgFTwvqMzqGdMMSW
    sPbCtCCQQLffZGdWNLWDDzLzGM
    PQPBBtfZCZsmJPPplwwmTwpcTcmcgj
    NBmBRCCsBTRNTndGdswnlwvwnw
    fvbqrbPLqpGwScGGwbbb
    HJDPJFJLJtpJHCvCFBBBBNNWvF
    HJHgNQJBSlRRbJDRDb
    RptsfnshscWMLMZDZp
    njmrnPznnsTRTtPzFzRTswgQwqvVVwBNwwvjqCHqHq
    CBMgBJCTNgQcsQspPpWjRrWrsWsn
    mwLvHLGbdHbGzSHmvmvHzrhjjjPptjWGqZPPZhPRWWGP
    vbbrLFwLFDJFDfFN
    TnPvZSnQgQPHnnnQvgMSWppWNfWRpWfMtthMNDhN
    wLJmLBmGFBFdLBbCBbVCVlsGsWhtHqthRRhqhtHHGqqf
    LmHLbCjjBLVZzZSgzQgjrc
    wdSwfpBhtFbStpftjSVhBwFrGrsQnQgnGrQmqCPmDrmmDb
    zJvzLJLNZNscLzNHHLrGPvGGPrDDqGgDPDgC
    RWsNNRMsHTHLHTlMczLHZLWtpFwfpthSjFtwFhjSVplwtj
    QbrBDLGGRJMQJQJDbQbGvNscWNnTdvnvtnLcccvl
    fqZgpVPZHPmfgPPjBFgcscvNNccdddtdNvdFTs
    CgPpghfjjPgVmfBMMCRJQQJzJBwM
    jLWDqLdWdwLfHwJwzSSfwS
    gCgRRltMrlrCcCMzcBSVfZQfVNZNVSBVNNNh
    gMrcPntccGgzgTMlMPrtDWFvLqqdLnDsmLLFFqvp
    ttHJNccRRwmnsnHnHWMSwqfgvgfwSQZfQf
    ShpLhhzTPBMpQqQgvM
    zhbFjVdrjFjVljrVbdPddSTPHNssHnHlRNCHtRtsctJtGsRJ
    zMVTscVhQhGGhClv
    LfMJmgSBpLRfHmBPgpmJPSBdvQNtlHvrHvNNtNNNClGdGN
    JFJmmSFFbFFbRJPBgFPmSBPMzzWWTDjjTsTqqwjVWbjjVVsZ
    HZpCnwnggfFggbgLDcTb
    SjvWjGzNGGzRjSGmMcLhvhMhFMCcmv
    rjrVJNjVrzVNPrwtPwPCHBPB
    SWwFbTzsSjPzpjFbsWPTWTcWLCLgLgLBZjGVDjCVBBgCBGCZ
    lrJJttQcHqrHrvggHVBgBLffBC
    lnhhcqNRJWzhTdsWFz
    vzldvzlclbFjFvmtjZ
    DDNMNStMsSsGnhSMwQjTQVgVbwMbVTTQ
    DsDSCNNGpLtsNLpnNsqLppDzCBcdJHBzllcJfzJBPBdBlR
    qWNfDvffbJBFDpNfmpbwhGhwjLgTrGwhbGGwrj
    ZctMVCcVVQtTpthlnLtppw
    QMcRSPMZcpCZqDFNRFHNJFFF
    RmztpGSssNMzJRpCvqsCrqdHCBlBdw
    gffPFDcqVbgqWgjlPlwCCrdBdllnBH
    cFFZcbcqfQhgbcNJZRSMRtmNJptS
    PZthPBWlPNPSPtmHHggFGgBJJbwg
    qqzDvLLrfDpvvDLzqvnLzqpzbrCRGJRHwFCmHRwGwgwbbRCj
    nnpnMfpMLTVqfmthmsMNSScMhS
    dflvbdvpfffzpnNLNbWqtblqHjmVhVRhHrwrwrswhHnjsmwh
    gSGMdMcJBgMTGPSPDVZhHhHZmDZhrwwjVm
    CPJQGBGGPcSTFcTCScFtLLdWvptWLbNpNzvWQL
    WThqhvvRDJDRhwcrscNDNFgDHNct
    fnrZVnfVjrSGGLzZbnLzZLjVHstHHHQtgQbPpPcpHsscsFpN
    SVjZSzZdndVCdSSZmTRvMWBRWvvWlrvmhJ
    BcllhPPmMMBPcbRwgQtgHHgtmwgzmt
    rpLqbrbTnNvqjLqLNqrNLvHzDtwpDCzFwggttFFHCQFQ
    LrrrNLqjZSTsZZsvjbLjPhcBBlBsBcGPPcPlPVGP
    HHhrggvSHDtCDsfF
    ZMpLblppNZBDBwLzLLpMssCntfWdCFCnfCCtRNtq
    lbmJlzzLMPMmlBzhSJVccSJhTvSTDh
    sdjBBFqHscFnHTzCnRSnzgVTlC
    LpWWtvZfrpbLpZpWftprLCCNMzCZMmmzTNNTmSSVSM
    pLVtrtbGvpbpGLfPddHBscBQJJGcwsQq
    hLcLnVVcfQBLZPVZnThfVVmjqjHNjgvNfdvpNdrrvvfp
    lbRlWFHJtGNGpqmrqrCN
    DzRRDFsbDtFtDJtWRztzJZVBQMhTsLhQZMZHVLcLcP
    WgbdmgMmWDDvcPcpbz
    jffpllHSpHRptRRGRntSVwvLSCCJDzcCcDLvCzPP
    tRFrnlGfZrQpBpgQQsgF
    TpbBZbCCHCGZNHbzGqgFdNlcFSdNlStSqg
    wvWnWwLCPjJPJhMWtWdMfFSMgcdM
    hhmvmJrJLJJJPvvhDjswCRGHHrHzBBHGVRQBzRRQ
    zChCSBbpSsQscDHHQh
    LNJJRgGltJDvfcrfgHfZ
    lJNRGlLnNJtTGVMlFTbwSWqjBbzWWHSW
    NDTJQDVwCTCJhVGDLfbBbBfbGqbfHBfBHb
    lMgMrggMrmmtzMcgWdlmMlbsRjSRBsTRBWsSHSBTHRBj
    cMPlgztzrPMznnMPpgddgdzpwDDNNwhNFCTwNZQFLTVTwV
    ZgshQgzQnnwMtDwBwv
    SFWFlFZRRcmlWmWRBCDwvwwftBtLmfLf
    PjRFdTdWGddrGlPjcsJZpJzTqhzQJzNHhz
    PgHQgddszgdGPWpMjljMcj
    bSqTqnZLnDJSmnmZmtllGsnVtnWjGGWtjl
    fqSLDbRSfBdHsRwsFdHd
    RwHWZpCWhHvwvHCBMBpJMJGPJJnJgc
    lztljTFljRRBBzBnBMnJMS
    QbRljFtQfljbbFqNFrdZVrZfdCCwVwvddH
    sHzztVzLTgnssPggHHsnCtzBmfBMrMccBBmqmrBqBCRqMf
    ZhDQJhFDqjmSMrRF
    dZpwDhNhhZpQJdDQpwnsGttGwLtRRTLRts
    QJNhClVgPTTtPNCJJCtJhlNPZZRVZfvfzZzmvvzvsmZsvmzR
    blBWBpdbLBDqBpszzffRsvdzjvvd
    BLWpqBbqnDHqBbGlnWGBPcPJcHTTPrhtgNtCtgPc
    jWVJqVwgsJcHCVlQVVQNBp
    vGhGhTPtSSNCddSBCH
    ZCCDtbDftZsqrrcnWW
    hJThjThhVzVTZZwnNZRdgmzt
    lrbSSddsrbPQpsvNtgPRmtHmvtnR
    GQrspWdSGbDcsFFLBhCGVBjhjj
    rHdlHdZDlTcflcNfcrCgcTWWpWQFsRWsFjRCsCjWCmhF
    BnqbvQPLGLBPwqGmsVshsSWShGms
    PzzPPQJPMJtJbbznPnDdrHlNldDNltrgtfDg
    SmmMQhPSlmTwPpmnpllMSMPrccFDqFrDFGgqrDcCwfDgwq
    bVdLLNvdQWVbJbQLVGfGDGfDgrFrqgqJgg
    vjjWsbQdBsszhsHlhhPPSHsM
    PqzJqNzsJgsgNqPdLJPPPNVpMMVWGlFWNFGMpWppGF
    ZnZBjttQZcQZRTQDjQwGFlWMlGdGWVrWWlGn
    ZRDBRSZDSdSLsqJHfSbzzL
    rljJqtZlJqlJcvBNJBNQfQ
    TVMWznvPMTFWznwPFFvwFbbBNBgbcNpQdNcBFQpb
    mDnLWsPLvLMnnnmTzLzVCtlRRtjSljCZhDlhtqSq
    fgWMHClGMWfgRWWWGCfmfgCSVQNTDFHTtddVQQDZNLDZtVVL
    wSqbsvzpwpbpdFTNLQwLNTFN
    zscjPnPqsJlmPJCJSC
    GZSwQjGwGrCGwrTjdCTwdTBpqqlmNmVpNrNvplJqNNpl
    zMfJnDcbRRDRFbzDFRLFBtqNmqqtNBmNBvNm
    sHcJRRHzzfQTjjCjQjCH
    wJCVVbJgCLCwGsMbbGTlsRWHsztZPZWtPrPrWrHzrz
    DBqdvfqDBqFpWZFrtppZJp
    djqNfQcjDQjMgbbwLjlJGn
    TSwfZMfpQwcCCCCrbbCZ
    PLJmGJnjqjrsCjMMVj
    LnNNLLLnFFWmLFMGNMDgfRpDQSfwSfgQzBHwTS
    CdjNCMmdCrVmCjJdVjFNMtMzhWwpGbpBhPZZZDbGPpDhpr
    QSfHzlvgTQffSSHHclgfHnqPbPPPppBhpWDhwWvPhvbwwh
    cQfQRgQnQsnsQSgHRQJsCFMsCjLzJJFjCdNC
    ltLlJttmQdfVRhNmhB
    gWWDrPSvCSWgMMMZBVBdTQPQZNZVPR
    vCbwQzcQrCrLFHwJpHHGpp
    VbRVvVHRbJVTzVLBVPtt
    cSdgSZSZZFhnFcFwdDQcZZhgzpTlzLDzlWTvBWLztBtpLplT
    hZZvdrcSZQZSSwncdHCqHmGHqJrCJqbNbq
    lwWmsQlDbCZbVWZq
    rRShhhhPjTsjTRvHhqfzqfqvBZZvBCZffC
    scPThhRSjQmmNpplcg
    FChtDTThDqZtjppjvgNvjl
    LBwsVdVHLVvvpVGjjgjS
    BbHLBfRcsHcBdMbdWJQPWFCQCZZhWrJPQp
    zMtWCstzNrQLpbplFwQwhb
    gDTDHGvvHVfVdGZVJGDGdnmbwmWFwfhpbnfjwwjpLl
    GJcHVJdvZJVGZWHSSvTZMCzrzzRNSBtBNPBMqNBB
    pLzZVVGGZmZVlmDsQglgsllc
    WSvrjRjrMMFFnFjnrnrdjBRRgdsblQQPbpggsclNDDbPstDs
    SMWRBrrrvSRBSSvWWWBTMTCqpZzLCCTCwJZwwzGZzqHL
    TvfGwGZpPnSNgSSnGh
    srLVHLcjsjVtHqjjrjFjcCqPBggqNQQnMqhgngnznNNB
    VtdmPHLmtVHFLdmZWRJlWpWWWlmWfp
    SbSbdTsrVrdhfSdDGJWGmNwWWPwTGP
    BqlRpBMmllpmnpvvDJPZWPJwZcJgDD
    FFRMCnRFtCMRlMplqMBRBppVbtzdrdhssrmHzVVSsVhVHz
    dNrhhLsrshSmmRcPhm
    WMCngCzCvzvMMpplQvzWlRBPcVStSmTSQbbVSPQmwm
    MpzvWnllglJfqfMgsNdZHqNjdDsPHqqZ
    rNvGZRsRcRRBtBCttB
    DwPPQWnWWnPQnJlPhmTtBFBmqzhpmnFh
    QwQQQlbPPMWwDdDwlVDJJPPdvdSjrjdrsgssLLsZLNBrNNNr
    VjMMVzngnjQQfJDchZqGNqFPcg
    SWBwTtWSFTHwFClHHmwBPcJJDhNGPJNPPhPPGhJt
    CBvSBBBWHdmRTvRWRQFLQRnjnfLLzVbs
    flSpvLlmZpCpZmVSBtlvHHjFHTdssZdjHFdTWdNh
    RmQMQJRQJQmPgrzJrPcRQRJcWdNTGTGGFhGTdFhHThHGMTsF
    RzJrqqcqPRqqJDDqttCpmtlwBpDflSLt
    hBjPZbPBbWvTRnLRWntD
    MNGQNsQwfzsdGfgTGfzQwwffmnCRDVmJLRLCvnvLDvJCDgRL
    wTTdFldNHzTMljjFqphrBqhrZb
    wDcMCbZbzPDcZDWQdrJLrQrZBLRBQr
    FFSHStjtHgllgFdSNmlfFStBqRRssRsRJrLrjrrJBRVhLJ
    fGggtfHtgWMwbCGdCT
    RQrQDDbVGrRSfbVbGtmGtwHFWsCCzsJSJJHsJPJvWC
    hphQnhZQNjlBBcMMpCsHwFjvvHWHWsFvjC
    ppcnnBZqllTQfmrffbtGTDGt
    dsDFsBZBhCFhshFrpBFnmLQmHmRgRbLqmmmRQDLm
    PPBBNNNtGTwJNfTJffNttfLQgqLgHvHbqRwlgmblRvll
    NSNTGTJTWPjGWMPSJJzrBSpzdFSddCFdncrs
    bPzRlMPTzTMldJMnhswcjzfQVccQhc
    HCCqNmNmQQmQssJn
    pHptprtgRStTtMJt
    nTmhrsPMsTfmHHGcSgtj
    bJJwdlrJQLlvwlQDDwSbgffGVNjfgjNtVbcf
    QlpDQFJdvdFqJdFpLvDFpLLnzZMnBMRRzMTqnrzqTRPznz
    qRVRqBzgwqRpqRgVqQRPpQJJPrPhPGJnsGrCFdFJrZdG
    ZvWDmMvmSvCndssrsJ
    WcZcNWlcMjBQpzNTqVBp
    DpLPZLDDlcgmDmhVgfgfWWRwhwwt
    VrVMdbCrrBTjCMQQtMwQNSqMQW
    VCBHdJHdvrrFsbsdrBJTdTzZcpmZGDGPlmzmlccFDZDn"
  end
end
