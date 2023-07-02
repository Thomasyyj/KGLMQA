from preprocess_utils.graph import generate_adj_data_from_grounded_concepts__use_LM

if __name__ == '__main__':
    generate_adj_data_from_grounded_concepts__use_LM('./data/csqa/grounded/train.grounded.jsonl','./data/cpnet/conceptnet.en.pruned.graph','./data/cpnet/concept.txt','./data/csqa/graph/train.graph.adj.pk',num_processes=50)

